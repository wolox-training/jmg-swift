//
//  LibraryViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 15/04/2021.
//

import Foundation
import UIKit

class LibraryViewModel {
    
    // MARK: Properties
    let repository =  BookRepository()
    var booksArray : [Book] = []
    
    
    // MARK: Presentation
    var bookCount: Int {
        booksArray.count
    }
    
    // MARK: Public interface
    func createLibraryCellViewModel(for index: Int) -> LibraryCellViewModel {
        let book = booksArray[index]
        return LibraryCellViewModel(book: book)
    }
    
    // MARK: API Requests
    func getBooks(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        repository.fetchBooks(onSuccess: { books in
            self.booksArray = books
            onSuccess()
        }, onError: { error in
            onError()
        })
    }
    
}
