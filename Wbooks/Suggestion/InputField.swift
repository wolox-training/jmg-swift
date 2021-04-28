//
//  InputField.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

@IBDesignable
class InputField: UITextField {
    
    // MARK: Properties
    
    
    // MARK: Actions
    func isValid(string: String) -> Bool {
        formatInvalid()
        return true
    }
    
    func formatInvalid() {
        self.textColor = UIColor.unavailableRed
        self.layer.borderColor = UIColor.unavailableRed.cgColor
    }
}
