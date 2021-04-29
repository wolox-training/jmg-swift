//
//  SuggestionViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

class SuggestionViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
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
    
    @objc func coverInputTapped() {
        print("Cover input tapped")
//        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
//        
//        let chooseAction = UIAlertAction(title: "Gallery", style: .default) { _ in
//            let imagePickerController = UIImagePickerController()
//            imagePickerController.delegate = self
//            imagePickerController.sourceType = .photoLibrary
//            self.present(imagePickerController, animated: true, completion: .none)
//        }
//        alertController.addAction(chooseAction)
//        
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            let takeAction = UIAlertAction(title: "Camera", style: .default) { _ in
//                let imagePickerController = UIImagePickerController()
//                imagePickerController.delegate = self
//                imagePickerController.sourceType = .camera
//                self.present(imagePickerController, animated: true, completion: .none)
//            }
//            alertController.addAction(takeAction)
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
//        alertController.addAction(cancelAction)
//        
//        self.present(imagePickerController, animated: true, completion: nil)
//        
//        // imagePickerController(_:, didFinishPickingMediaWithInfo: let image = info[UIImagePickerControllerOriginalImage] as! UImage)
//        
//        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    @objc func submitButtonTapped() {
        let inputsArray = [suggestionView.titleInput, suggestionView.authorInput, suggestionView.yearInput, suggestionView.topicInput, suggestionView.descriptionInput]
        if inputsArray.contains(where: { ($0?.isEmpty())! }) || !(CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: suggestionView.yearInput.text!))) {
            let alertController = UIAlertController(title: "Error", message: "One or more fields are empty or not valid", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true)
        } else {
            viewModel.addBook(book: generateBook(), onSuccess: {
                // alert displaying success message
                // reset fields
            }, onError: { _ in
                // alert displaying error message
            })
        }
    }
    
    private func generateBook() -> NewBook {
        return NewBook(title: suggestionView.titleInput.text!, author: suggestionView.authorInput.text!, genre: suggestionView.topicInput.text!, year: suggestionView.yearInput.text!, image: "", status: "Available")
    }

}
