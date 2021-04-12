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
            userLabel.text = NSLocalizedString("USERNAME_LABEL", comment: "")
        }
    }
    @IBOutlet weak var userInput: UITextField! {
        didSet {
            userInput.placeholder = NSLocalizedString("USERNAME_TEXT_FIELD_PLACEHOLDER", comment: "")
        }
    }
    @IBOutlet weak var passwordLabel: UILabel! {
        didSet {
            passwordLabel.text = NSLocalizedString("PASSWORD_LABEL", comment: "")
        }
    }
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.setTitle(NSLocalizedString("LOGIN_BUTTON", comment: ""), for: .normal)
        }
    }
    
}
