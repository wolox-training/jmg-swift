//
//  SuggestionView.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

final class SuggestionView: NibView {
    
    // MARK: Properties

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var coverInput: UIImageView!
    
    @IBOutlet weak var titleInput: InputField!
    @IBOutlet weak var authorInput: InputField!
    @IBOutlet weak var yearInput: InputField!
    @IBOutlet weak var topicInput: InputField!
    @IBOutlet weak var descriptionInput: InputField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    let titleInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.TITLE_INPUT_PLACEHOLDER", comment: "Placeholder text for the book title input field")
    let authorInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.AUTHOR_INPUT_PLACEHOLDER", comment: "Placeholder text for the book author input field")
    let yearInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.YEAR_INPUT_PLACEHOLDER", comment: "Placeholder text for the book release year input field")
    let topicInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.TOPIC_INPUT_PLACEHOLDER", comment: "Placeholder text for the book genre input field")
    let descriptionInputPlaceholder = NSLocalizedString("ADDNEW_VIEW.DESCRIPTION_INPUT_PLACEHOLDER", comment: "Placeholder text for the book description input field")
    let submitButtonTitle = NSLocalizedString("ADDNEW_VIEW.SUBMIT_BUTTON_TITLE", comment: "Main title at the top of the new book view")
    
    // MARK: Actions
    func setupTextFields() {
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
        self.submitButton.setMainStyle()
        self.submitButton.setTitle(submitButtonTitle, for: .normal)
        
    }
    
}
