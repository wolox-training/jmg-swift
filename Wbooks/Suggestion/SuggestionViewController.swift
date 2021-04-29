//
//  SuggestionViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

final class SuggestionViewController: UIViewController & UINavigationControllerDelegate {
    
    // MARK: Properties
    private lazy var suggestionView: SuggestionView = SuggestionView()
    private var viewModel: SuggestionViewModel
    let galleryTitle = NSLocalizedString("ALERT_BOX.GALLERY_OPTION", comment: "")
    let cameraTitle = NSLocalizedString("ALERT_BOX.CAMERA_OPTION", comment: "")
    let cancelTitle = NSLocalizedString("ALERT_BOX.CANCEL", comment: "")
    
    // MARK: Inizializers
    init(viewModel: SuggestionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextFields()
    }
    
    override func loadView() {
        view = suggestionView
        setupNavBar()
    }
    
    func setupView() {
        navigationItem.leftBarButtonItem = navigationItem.backBarButtonItem
        setupSubmitButton()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(coverInputTapped))
        suggestionView.coverInput.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupSubmitButton() {
        suggestionView.submitButton.setMainStyle()
        suggestionView.submitButton.setTitle(NSLocalizedString("ADDNEW_VIEW.SUBMIT_BUTTON_TITLE", comment: "Main title at the top of the new book view"), for: .normal)
        suggestionView.submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    func setupTextFields() {
        suggestionView.titleInput.setupTextField()
        suggestionView.titleInput.placeholder = NSLocalizedString("ADDNEW_VIEW.TITLE_INPUT_PLACEHOLDER", comment: "Placeholder text for the book title input field")
        suggestionView.authorInput.setupTextField()
        suggestionView.authorInput.placeholder = NSLocalizedString("ADDNEW_VIEW.AUTHOR_INPUT_PLACEHOLDER", comment: "Placeholder text for the book author input field")
        suggestionView.yearInput.setupTextField()
        suggestionView.yearInput.placeholder = NSLocalizedString("ADDNEW_VIEW.YEAR_INPUT_PLACEHOLDER", comment: "Placeholder text for the book release year input field")
        suggestionView.topicInput.setupTextField()
        suggestionView.topicInput.placeholder = NSLocalizedString("ADDNEW_VIEW.TOPIC_INPUT_PLACEHOLDER", comment: "Placeholder text for the book genre input field")
        suggestionView.descriptionInput.setupTextField()
        suggestionView.descriptionInput.placeholder = NSLocalizedString("ADDNEW_VIEW.DESCRIPTION_INPUT_PLACEHOLDER", comment: "Placeholder text for the book description input field")
    }
    
    func setupNavBar() {
        navigationItem.title = NSLocalizedString("ADDNEW_VIEW.TITLE", comment: "Main title at the top of the book suggestion view")
    }
    
    // MARK: Actions
    @objc func coverInputTapped() {
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
        
        let chooseAction = UIAlertAction(title: galleryTitle, style: .default) { _ in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: .none)
        }
        alertController.addAction(chooseAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takeAction = UIAlertAction(title: cameraTitle, style: .default) { _ in
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: .none)
            }
            alertController.addAction(takeAction)
        }
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: .none)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func submitButtonTapped() {
        let inputsArray = [suggestionView.titleInput, suggestionView.authorInput, suggestionView.yearInput, suggestionView.topicInput, suggestionView.descriptionInput]
        if inputsArray.contains(where: { ($0?.isEmpty())! }) || !isNumeric(string: suggestionView.yearInput.text!) {
            let errorMessage = NSLocalizedString("ALERT_BOX.FIELD_ERROR", comment: "Message detailing an error in the alert box")
            self.displayErrorAlert(message: errorMessage)
        } else {
            viewModel.addBook(book: generateBook(), onSuccess: {
                for field in inputsArray {
                    field!.text = ""
                    field!.setDefaultStyle()
                }
                self.suggestionView.coverInput.image = UIImage.addNew
                self.displaySuccessAlert()
            }, onError: {
                let errorMessage = NSLocalizedString("ALERT_BOX.BOOK_ADD_ERROR_MESSAGE", comment: "Message detailing an error in the alert box")
                self.displayErrorAlert(message: errorMessage)
            })
        }
    }
    
    private func generateBook() -> NewBook {
        return NewBook(title: suggestionView.titleInput.text!, author: suggestionView.authorInput.text!, genre: suggestionView.topicInput.text!, year: suggestionView.yearInput.text!, image: "", status: "Available")
    }
    
    private func isNumeric(string: String) -> Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
    }
    
    private func displayErrorAlert(message: String) {
        let errorTitle = NSLocalizedString("ALERT_BOX.TITLE", comment: "Title for the error alert box")
        let errorDismiss = NSLocalizedString("ALERT_BOX.BUTTON", comment: "Text for the dismiss button on the alert box")
        
        let alertController = UIAlertController(title: errorTitle, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: errorDismiss, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    
    private func displaySuccessAlert() {
        let rentSuccessMessage = NSLocalizedString("ALERT_BOX.BOOK_ADDED", comment: "Message detailing an error in the alert box")
        let errorDismiss = NSLocalizedString("ALERT_BOX.BUTTON", comment: "Text for the dismiss button on the alert box")

        let alertController = UIAlertController(title: nil, message: rentSuccessMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: errorDismiss, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    
}

extension SuggestionViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        print("image saved to var")
        suggestionView.coverInput.image = image
        print("image should've changed")
        picker.dismiss(animated: true, completion: nil)
        print("picker dismissed")
    }
    
}
