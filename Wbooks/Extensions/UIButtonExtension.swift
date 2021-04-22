//
//  UIButtonExtension.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 22/04/2021.
//

import UIKit

extension UIButton {
    
    func setGradientStyle() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [CGColor(srgbRed: 0, green: 173, blue: 236, alpha: 1), CGColor(srgbRed: 57, green: 205, blue: 205, alpha: 1)]
        gradientLayer.locations = [0,1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
        
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.setTitleColor(.white, for: .normal)
    }
    
    func setBorderStyle() {
        self.setTitleColor(UIColor(red: 0, green: 173, blue: 236, alpha: 1), for: .normal)
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor(srgbRed: 0, green: 173, blue: 236, alpha: 1)
    }
    
}
