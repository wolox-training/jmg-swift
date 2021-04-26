//
//  UIButtonExtension.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 22/04/2021.
//

import UIKit

extension UIButton {
    
    func setMainStyle() {
        setupStyle()
        self.setTitleColor(.white, for: .normal)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.mainGradientFirst, UIColor.mainGradientLast]
        setupGradient(with: gradientLayer)
    }
    
    func setSecondaryStyle() {
        setupStyle()
        self.setTitleColor(UIColor.defaultBlue, for: .normal)
        self.layer.borderColor = UIColor.defaultBlue.cgColor
        self.layer.borderWidth = 1
    }
    
    func setUnavailableStyle() {
        setupStyle()
        self.setTitleColor(.white, for: .normal)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.unavailableGradientFirst, UIColor.unavailableGradientLast]
        setupGradient(with: gradientLayer)
        
    }
    
    func setGoogleStyle() {
        setupStyle()
        self.setTitleColor(UIColor.defaultGrey, for: .normal)
        self.layer.borderColor = UIColor.defaultGrey.cgColor
        self.layer.borderWidth = 1
    }
    
    private func setupStyle() {
        self.backgroundColor = .clear
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 24
        self.clipsToBounds = true
    }
    
    private func setupGradient(with gradientLayer: CAGradientLayer) {
        gradientLayer.locations = [0,1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
