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
    private let repository: RentRepositoryType
    
    // MARK: Inizialization
    init(book: Book, repository: RentRepositoryType = BookRepository()) {
        self.book = book
        self.repository = repository
    }
    
    // MARK: Public interface
    func createBookDetailsViewModel() -> BookDetailViewModel {
        return BookDetailViewModel(book: book, repository: self.repository)
    }
}
