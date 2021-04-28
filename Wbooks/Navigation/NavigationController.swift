//
//  NavigationController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 09/04/2021.
//

import UIKit

final class NavigationController: UINavigationController {

    // MARK: Properties
    private let appTint: UIColor = UIColor.defaultBlue

    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }

    private func setupNavBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = appTint
        UINavigationBar.appearance().barStyle = .black
    }
}
