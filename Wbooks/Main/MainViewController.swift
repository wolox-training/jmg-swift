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
    private var viewModel = MainViewModel()
    
    // MARK: Initializers
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
    
    // MARK: Navigation methods
    
    @objc private func loginButtonTapped() {
        let controller = TabBarController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
}
