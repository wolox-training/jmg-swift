//
//  Book.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 08/04/2021.
//

import UIKit

struct Book: Codable {

    let id: Int
    let title, author, genre, year, image, status: String

}

struct NewBook: Codable {
    
    let title, author, genre, year, image, status: String
    
}
