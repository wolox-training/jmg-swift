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
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            // Modify button properties here
            
        }
    }
    
    // MARK: Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("Login successful 👍")
        // let libraryView: LibraryView = LibraryView()
        
        // App should display Library View
        
    }
}
