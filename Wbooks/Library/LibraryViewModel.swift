//
//  LibraryViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 15/04/2021.
//

import Foundation
import UIKit

struct LibraryViewModel {
    
    // MARK: Properties
    let repository =  BookRepository()
    private let booksArray : [Book] = []
    
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
    func getBooks() {
        let onSuccess = { books in
            print(books)
            // fill booksArray from JSON
        }
        let onError = { error in
            print(error)
            // display error alert (UIAlertController?)
        }
        repository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
    
}
