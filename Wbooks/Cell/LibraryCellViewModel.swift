//
//  LibraryCellViewModel.swift
//  Wbooks
//
//  Created by Gabriel Mazzei on 15/04/2021.
//

import Foundation
import UIKit

struct LibraryCellViewModel {
    
    private let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    // MARK: - Presentation
    
    var cover: UIImage {
        book.cover
    }
    
    var title: String {
        book.title
    }
    
    var author: String {
        book.author
    }
}
