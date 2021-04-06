//
//  MainViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 05/04/2021.
//

import UIKit

final class MainViewController: UIViewController {

    private lazy var mainView: MainView = MainView()

    // MARK: - Lifecycle methods

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
