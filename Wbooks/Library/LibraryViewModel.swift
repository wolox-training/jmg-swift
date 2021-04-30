//
//  LibraryViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 15/04/2021.
//

import UIKit

class LibraryViewModel {

    // MARK: Properties
    private let repository: BookRepositoryType
    var booksArray: [Book] = []

    // MARK: Initializers
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }

    // MARK: Presentation
    var bookCount: Int {
        booksArray.count
    }

    // MARK: Public interface
    func createLibraryCellViewModel(for index: Int) -> LibraryCellViewModel {
        let book = booksArray[index]
        return LibraryCellViewModel(book: book)
    }
    
    func createDetailViewModel(for index: Int) -> DetailViewModel {
        let book = booksArray[index]
        return DetailViewModel(book: book)
    }
    
    // MARK: API Requests
    func getBooks(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        repository.fetchBooks(onSuccess: { [weak self] (books) -> Void in
            self?.booksArray = books
            onSuccess()
        }, onError: { _ in
            onError()
        })
    }

}
