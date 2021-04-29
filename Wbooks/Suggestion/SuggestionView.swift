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
    
}
