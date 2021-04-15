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

        let library = NavigationController(rootViewController: LibraryController(viewModel: LibraryViewModel()))
        let wishlist  = UIViewController()
        let addNew = UIViewController()
        let rentals = UIViewController()
        let settings = UIViewController()
        
        viewControllers = [library, wishlist, addNew, rentals, settings]
                
        library.tabBarItem = UITabBarItem()
        library.tabBarItem.title = NSLocalizedString("TAB_BAR.LIBRARY_BUTTON_TITLE", comment: "Title under the Library button in the tab bar")
        library.tabBarItem.image = UIImage(named: "LibraryButton")
        library.tabBarItem.selectedImage = UIImage(named: "LibraryButtonActive")
        library.tabBarItem.tag = 0
        
        wishlist.tabBarItem = UITabBarItem()
        wishlist.tabBarItem.title = NSLocalizedString("TAB_BAR.WISHLIST_BUTTON_TITLE", comment: "Title under the Wishlist button in the tab bar")
        wishlist.tabBarItem.image = UIImage(named: "WishlistButton")
        wishlist.tabBarItem.selectedImage = UIImage(named: "WishlistButtonActive")
        wishlist.tabBarItem.tag = 1
        
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.title = NSLocalizedString("TAB_BAR.ADDNEW_BUTTON_TITLE", comment: "Title under the Add New button in the tab bar")
        addNew.tabBarItem.image = UIImage(named: "AddNewButton")
        addNew.tabBarItem.selectedImage = UIImage(named: "AddNewButtonActive")
        addNew.tabBarItem.tag = 2
        
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.title = NSLocalizedString("TAB_BAR.RENTALS_BUTTON_TITLE", comment: "Title under the Rentals button in the tab bar")
        rentals.tabBarItem.image = UIImage(named: "RentalsButton")
        rentals.tabBarItem.selectedImage = UIImage(named: "RentalsButtonActive")
        rentals.tabBarItem.tag = 3
        
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.title = NSLocalizedString("TAB_BAR.SETTINGS_BUTTON_TITLE", comment: "Title under the Settings button in the tab bar")
        settings.tabBarItem.image = UIImage(named: "SettingsButton")
        settings.tabBarItem.selectedImage = UIImage(named: "SettingsButtonActive")
        settings.tabBarItem.tag = 4
    }

}
