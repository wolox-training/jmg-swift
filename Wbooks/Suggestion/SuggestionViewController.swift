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
    }
    
    override func loadView() {
        view = suggestionView
        setupNavBar()
    }
    
    func setupView() {
        suggestionView.setupSubmitButton()
        suggestionView.submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        suggestionView.setupTextFields()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(coverInputTapped))
        suggestionView.coverInput.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupSubmitButton() {
        
    }
    
    func setupNavBar() {
        navigationItem.title = NSLocalizedString("ADDNEW_VIEW.TITLE", comment: "Main title at the top of the book suggestion view")
    }
    
    // MARK: Actions
    @objc func coverInputTapped() {
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        
        let galleryTitle = NSLocalizedString("ALERT_BOX.GALLERY_OPTION", comment: "Title for the Gallery option button on the image method picker")
        let cameraTitle = NSLocalizedString("ALERT_BOX.CAMERA_OPTION", comment: "Title for the Camera option button on the image method picker")
        let cancelTitle = NSLocalizedString("ALERT_BOX.CANCEL", comment: "Title for the Cancel button on the image method picker")
        
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
