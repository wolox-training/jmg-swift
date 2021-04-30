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
    let bottomLine = CALayer()
    
    // MARK: Actions
    func setupTextField() {
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - 2, width: self.frame.width, height: 1)
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
        bottomLine.backgroundColor = UIColor.defaultGrey.cgColor
        self.textColor = UIColor.defaultGrey
        self.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldDidEndEditing(_:reason:)), for: .editingDidEnd)
        
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        self.setActiveStyle()
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if self.isEmpty() {
            self.setInvalidStyle()
            return
        }
        self.setDefaultStyle()
    }
    
    func isValid() -> Bool {
       return !isEmpty()
    }
    
    func setDefaultStyle() {
        self.textColor = UIColor.defaultGrey
        bottomLine.backgroundColor = UIColor.defaultGrey.cgColor
    }
    
    func setActiveStyle() {
        bottomLine.backgroundColor = UIColor.defaultBlue.cgColor
        self.textColor = .black
    }
    
    func setInvalidStyle() {
        self.textColor = UIColor.unavailableRed
        bottomLine.backgroundColor = UIColor.unavailableRed.cgColor
        
    }
    
    func isEmpty() -> Bool {
        return self.text?.trimmingCharacters(in: .whitespaces) == ""
    }
    
}
