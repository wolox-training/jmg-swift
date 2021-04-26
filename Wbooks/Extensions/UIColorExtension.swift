//
//  UIColorExtension.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 26/04/2021.
//

import UIKit

extension UIColor {
    
    static var availableGreen: UIColor {
        return UIColor(named: "AvailableGreen")!
    }
    
    static var unavailableRed: UIColor {
        return UIColor(named: "UnavailableRed")!
    }
    
    static var defaultBlue: UIColor {
        return UIColor(named: "DefaultBlue")!
    }
    
    static var defaultGrey: UIColor {
        return UIColor(named:"DefaultGrey")!
    }
    
    static var mainGradientFirst: CGColor {
        return UIColor(named: "MainGradientFirst")!.cgColor
    }
    
    static var mainGradientLast: CGColor {
        return UIColor(named: "MainGradientLast")!.cgColor
    }
    
    static var unavailableGradientFirst: CGColor {
        return UIColor(named: "UnavailableGradientFirst")!.cgColor
    }
    
    static var unavailableGradientLast: CGColor {
        return UIColor(named: "UnavailableGradientLast")!.cgColor
    }
    
}
