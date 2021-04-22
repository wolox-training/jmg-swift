//
//  DetailViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

struct DetailViewModel {
    
    // MARK: Properties
    private let book: Book
    
    // MARK: Inizialization
    init(book: Book) {
        self.book = book
    }
    
    // MARK: Public interface
    func createBookDetailsViewModel() -> BookDetailViewModel {
        return BookDetailViewModel(book: book)
    }
}
