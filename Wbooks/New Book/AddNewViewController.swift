//
//  AddNewViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

final class AddNewViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: Properties
    private lazy var addNewView: AddNewView = AddNewView()
    private var viewModel: AddNewViewModel
    
    // MARK: Initialization
    init(viewModel: AddNewViewModel) {
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
        setupNavBar()
    }
    
    override func loadView() {
        view = addNewView
    }
    
    private func setupView() {
        addNewView.setupSubmitButton()
        addNewView.submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        addNewView.setupTextFields()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(coverInputTapped))
        addNewView.coverInput.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setupNavBar() {
        navigationItem.title = NSLocalizedString("ADDNEW_VIEW.TITLE", comment: "Main title at the top of the new book view")
    }
    
    // MARK: Actions
    @objc func coverInputTapped() {
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        
        let galleryTitle = NSLocalizedString("ALERT_BOX.GALLERY_OPTION", comment: "Title for the Gallery option button on the image method picker")
        let cameraTitle = NSLocalizedString("ALERT_BOX.CAMERA_OPTION", comment: "Title for the Camera option button on the image method picker")
        let cancelTitle = NSLocalizedString("ALERT_BOX.CANCEL", comment: "Title for the Cancel button on the image method picker")
        
        let chooseAction = UIAlertAction(title: galleryTitle, style: .default) { [weak self] _ in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self!.present(imagePickerController, animated: true, completion: .none)
        }
        alertController.addAction(chooseAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takeAction = UIAlertAction(title: cameraTitle, style: .default) { [weak self] _ in
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = .camera
                self!.present(imagePickerController, animated: true, completion: .none)
            }
            alertController.addAction(takeAction)
        }
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: .none)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func submitButtonTapped() {
        let inputsArray = [addNewView.titleInput, addNewView.authorInput, addNewView.yearInput, addNewView.topicInput, addNewView.descriptionInput]
        
        if areValid(fields: inputsArray) {
            let errorMessage = NSLocalizedString("ALERT_BOX.FIELD_ERROR", comment: "Message detailing an error in the alert box")
            self.displayErrorAlert(message: errorMessage)
        } else {
            viewModel.addBook(book: generateBook(), onSuccess: {
                self.clearFields(fields: inputsArray)
                self.addNewView.coverInput.image = UIImage.addNew
                self.displaySuccessAlert()
            }, onError: {
                let errorMessage = NSLocalizedString("ALERT_BOX.BOOK_ADD_ERROR_MESSAGE", comment: "Message detailing an error in the alert box")
                self.displayErrorAlert(message: errorMessage)
            })
        }
    }
    
    private func areValid(fields: [InputField?]) -> Bool {
        return fields.contains(where: { ($0!.isEmpty()) }) || !isNumeric(string: addNewView.yearInput.text!)
    }
    
    private func clearFields(fields: [InputField?]) {
        for field in fields {
            field!.text = ""
            field!.setDefaultStyle()
        }
    }
    
    private func generateBook() -> NewBook {
        return NewBook(title: addNewView.titleInput.text!, author: addNewView.authorInput.text!, genre: addNewView.topicInput.text!, year: addNewView.yearInput.text!, image: "", status: "Available")
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

extension AddNewViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        addNewView.coverInput.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
}
