//
//  NavigationController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 09/04/2021.
//

import UIKit

class NavigationController: UINavigationController {
    
    // MARK: Properties
    let appTint: UIColor = UIColor(red: 0, green: 173/255, blue: 238/255, alpha: 1)
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    private func setupNavBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "NavBarBG"), for: UIBarMetrics.default)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().barTintColor = appTint
        UINavigationBar.appearance().barStyle = .black
    }
}
