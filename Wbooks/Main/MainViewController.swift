//
//  MainViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 06/04/2021.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {

    // MARK: Properties
    private lazy var mainView: MainView = MainView()
    var mainViewModel = MainViewModel()

    // MARK: Lifecycle methods
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup(with: mainViewModel)
        setupLoginButton()
    }
    
    private func setupLoginButton() {
        mainView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func setup(with viewModel: MainViewModel) {
        mainView.userLabel.text = mainViewModel.userLabelText
        mainView.userInput.placeholder = mainViewModel.userInputPlaceholder
        mainView.passwordLabel.text = mainViewModel.passwordLabelText
        mainView.loginButton.setTitle(mainViewModel.loginButtonTitle, for: .normal)
    }
    
    // MARK: Navigation methods
    
    @objc private func loginButtonTapped() {
        let controller = TabBarController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
}
