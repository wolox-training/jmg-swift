//
//  MainViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 06/04/2021.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: Properties
    private lazy var mainView: MainView = MainView()
    private let mainViewModel = MainViewModel()

    // MARK: Lifecycle methods
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setup(with: mainViewModel)
        setupLoginButton()
    }

    private func setupLoginButton() {
        mainView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    // MARK: Navigation methods
    @objc private func loginButtonTapped() {
        let controller = TabBarController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }

}
