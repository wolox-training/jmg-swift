//
//  MainView.swift
//  Wbooks
//
//  Created by Gabriel Mazzei on 06/04/2021.
//

import Foundation
import UIKit

final class MainView: NibView {

    @IBOutlet weak var button: UIButton! {
        didSet {
            // The button can be modified here. For example, you could change its title:
            // button.setTitle("some new text", for: .normal)
        }
    }

    // MARK: Actions
    @IBAction func buttonTapped(_ sender: Any) {
        print("Log in realizado 👍")
    }
}
