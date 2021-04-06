//
//  ViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 05/04/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getValue(forKey: "WBooksKey")
    }
    
    // MARK: Actions
    @IBAction func logIn(_ sender: UIButton) {
        print("Log in realizado 👍")
    }
    
    // Check for Key value in Info.plist
    func getValue(forKey key : String) -> String?{
        print(Bundle.main.infoDictionary?[key] as? String)
        return Bundle.main.infoDictionary?[key] as? String
    }
    
}
