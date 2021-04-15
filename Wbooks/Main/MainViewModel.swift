//
//  MainViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 15/04/2021.
//

import Foundation

struct MainViewModel {
    
    // MARK: Presentation
    var userLabelText: String {
        NSLocalizedString("LOGIN_VIEW.USERNAME_LABEL", comment: "Label for the username input in the login screen")
    }
    
    var userInputPlaceholder: String {
        NSLocalizedString("LOGIN_VIEW.USERNAME_TEXT_FIELD_PLACEHOLDER", comment: "Placeholder text for the empty username text field in the login screen")
    }
    
    var passwordLabelText: String {
        NSLocalizedString("LOGIN_VIEW.PASSWORD_LABEL", comment: "Label for the password input in the login screen")
    }
    
    var loginButtonTitle: String {
        NSLocalizedString("LOGIN_VIEW.LOGIN_BUTTON", comment: "Text of the login button in the login screen")
    }
    
}
