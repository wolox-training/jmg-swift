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
    
    enum BookKey: String, CodingKey {
        case id = "id"
        case title = "title"
        case author = "author"
        case genre = "genre"
        case year = "year"
        case image = "image"
    }
    
    // MARK: Inizialization
    public init(from: Decoder) {
        let container = try! from.container(keyedBy: BookKey.self)
        id = try! container.decode(Int.self, forKey: .id)
        title = try! container.decode(String.self, forKey: .title)
        author = try! container.decode(String.self, forKey: .author)
        genre = try! container.decode(String.self, forKey: .genre)
        year = try! container.decode(String.self, forKey: .year)
        image = try! container.decode(String.self, forKey: .image)
    }
    
}
