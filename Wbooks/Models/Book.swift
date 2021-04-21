//
//  Book.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 08/04/2021.
//

import Foundation
import UIKit

struct Book: Codable {
    
    // MARK: Properties
    let id: Int
    let title, author, genre, year, image: String
    
}
