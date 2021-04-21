//
//  LibraryCellViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 15/04/2021.
//

import UIKit

struct LibraryCellViewModel {
    
    // MARK: Properties
    private let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    // MARK: Presentation
    var cover: String {
        book.image
    }
    
    var title: String {
        book.title
    }
    
    var author: String {
        book.author
    }

}
