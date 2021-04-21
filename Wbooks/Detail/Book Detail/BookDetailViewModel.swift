//
//  BookDetailViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

struct BookDetailViewModel {
    
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
    
    var year: String {
        book.year
    }
    
    var genre: String {
        book.genre
    }
    
    // var availability: Bool
    
}
