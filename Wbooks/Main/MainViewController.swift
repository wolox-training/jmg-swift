//
//  MainViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 06/04/2021.
//

import UIKit

final class MainViewController: UIViewController {

    private lazy var mainView: MainView = MainView()

    // MARK: Lifecycle methods
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginButton()
    }
    
    private func setupLoginButton() {
        mainView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        let controller = LibraryController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
}
