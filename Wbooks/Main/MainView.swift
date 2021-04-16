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
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    func setup(with viewModel: MainViewModel) {
        userLabel.text = viewModel.userLabelText
        userInput.placeholder = viewModel.userInputPlaceholder
        passwordLabel.text = viewModel.passwordLabelText
        loginButton.setTitle(viewModel.loginButtonTitle, for: .normal)
    }

}
