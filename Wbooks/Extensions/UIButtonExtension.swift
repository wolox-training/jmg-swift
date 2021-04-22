//
//  UIButtonExtension.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 22/04/2021.
//

import UIKit

extension UIButton {
    
    func setGradientStyle() {
        self.backgroundColor = .clear
        self.layer.borderWidth = 0
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(named: "Gradient First")?.cgColor, UIColor(named: "Gradient Last")?.cgColor]
        gradientLayer.locations = [0,1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setBorderStyle() {
        self.setTitleColor(UIColor(named: "Default Blue"), for: .normal)
        self.backgroundColor = .clear
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "Default Blue")?.cgColor
        self.clipsToBounds = true
    }
    
}
