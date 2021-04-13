//
//  MainView.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 06/04/2021.
//

import Foundation
import UIKit

final class MainView: NibView {
    
    // MARK: Properties
    @IBOutlet weak var userLabel: UILabel! {
        didSet {
            userLabel.text = NSLocalizedString("LOGIN_VIEW.USERNAME_LABEL", comment: "Label for the username input in the login screen")
        }
    }
    @IBOutlet weak var userInput: UITextField! {
        didSet {
            userInput.placeholder = NSLocalizedString("LOGIN_VIEW.USERNAME_TEXT_FIELD_PLACEHOLDER", comment: "Placeholder text for the empty username text field in the login screen")
        }
    }
    @IBOutlet weak var passwordLabel: UILabel! {
        didSet {
            passwordLabel.text = NSLocalizedString("LOGIN_VIEW.PASSWORD_LABEL", comment: "Label for the password input in the login screen")
        }
    }
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.setTitle(NSLocalizedString("LOGIN_VIEW.LOGIN_BUTTON", comment: "Text of the login button in the login screen"), for: .normal)
        }
    }
    
}
