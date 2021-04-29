//
//  SuggestionViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

struct SuggestionViewModel {
    
    // MARK: Properties
    private let repository: BookRepositoryType
    
    // MARK: Inizialization
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    // MARK: API Requests
    func addBook(book: NewBook, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        // generate book
        //post book
        print("Book added (or not)")
    }
    
}
