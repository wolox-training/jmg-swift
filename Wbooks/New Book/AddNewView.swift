//
//  AddNewView.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

final class AddNewView: NibView {
    
    // MARK: Properties

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var coverInput: UIImageView!
    
    @IBOutlet weak var titleInput: InputField!
    @IBOutlet weak var authorInput: InputField!
    @IBOutlet weak var yearInput: InputField!
    @IBOutlet weak var topicInput: InputField!
    @IBOutlet weak var descriptionInput: InputField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    // MARK: Actions
    func setupTextFields() {
        let titleInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.TITLE_INPUT_PLACEHOLDER", comment: "Placeholder text for the book title input field")
        let authorInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.AUTHOR_INPUT_PLACEHOLDER", comment: "Placeholder text for the book author input field")
        let yearInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.YEAR_INPUT_PLACEHOLDER", comment: "Placeholder text for the book release year input field")
        let topicInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.TOPIC_INPUT_PLACEHOLDER", comment: "Placeholder text for the book genre input field")
        let descriptionInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.DESCRIPTION_INPUT_PLACEHOLDER", comment: "Placeholder text for the book description input field")
        
        self.titleInput.setupTextField()
        self.titleInput.placeholder = titleInputPlaceholder
        self.authorInput.setupTextField()
        self.authorInput.placeholder = authorInputPlaceholder
        self.yearInput.setupTextField()
        self.yearInput.placeholder = yearInputPlaceholder
        self.topicInput.setupTextField()
        self.topicInput.placeholder = topicInputPlaceholder
        self.descriptionInput.setupTextField()
        self.descriptionInput.placeholder = descriptionInputPlaceholder
    }
    
    func setupSubmitButton() {
        let submitButtonTitle = NSLocalizedString("ADDNEW_VIEW.SUBMIT_BUTTON_TITLE", comment: "Main title at the top of the new book view")

        self.submitButton.setMainStyle()
        self.submitButton.setTitle(submitButtonTitle, for: .normal)
        
    }
    
}
