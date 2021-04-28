//
//  Comment.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 26/04/2021.
//

import UIKit

struct Comment: Codable {
    
    // MARK: Properties
    let id, book_id, user_id: Int
    let content: String
    
}
