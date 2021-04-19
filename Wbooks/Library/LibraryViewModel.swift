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
    func getBooks() {
        let onSuccess: ([Book]) -> Void = { books in
            self.booksArray = books
            print("Books retrieved from API")
        }
        let onError: (Error) -> Void = { error in
            print(error)
            // display error alert (UIAlertController?)
            // LibraryController(viewModel: LibraryViewModel()).displayAlert()
        }
        repository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
    
}
