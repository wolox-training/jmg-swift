//
//  TabBarController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 13/04/2021.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .white

        let library = LibraryController()
        let wishlist = MainViewController()
                
        library.tabBarItem = UITabBarItem()
        library.tabBarItem.title = title
        library.tabBarItem.image = UIImage(named: "LibraryButton")
        library.tabBarItem.selectedImage = UIImage(named: "LibraryButtonActive")
        library.tabBarItem.tag = 0
        
        wishlist.tabBarItem = UITabBarItem()
        wishlist.tabBarItem.title = title
        wishlist.tabBarItem.image = UIImage(named: "WishlistButton")
        wishlist.tabBarItem.selectedImage = UIImage(named: "WishlistButtonActive")
        wishlist.tabBarItem.tag = 0
        
        viewControllers = [library, wishlist]
    }

}
