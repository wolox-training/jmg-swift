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

    // Ver si puedo sacar la clave de Info.plist
    func getValue(forKey key : String) -> String?{
        print(key)
        print(Bundle.main.infoDictionary?[key] as? String)
        return Bundle.main.infoDictionary?[key] as? String
    }
    
}
