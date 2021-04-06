//
//  Enviroment.swift
//  Wbooks
//
//  Created by Agustin Paz on 06/04/2021.
//

import UIKit

struct Enviroment {

    /// Check for Key value in Info.plist
    func getValue(forKey key: String) -> String? {
        return Bundle.main.infoDictionary?[key] as? String
    }
}
