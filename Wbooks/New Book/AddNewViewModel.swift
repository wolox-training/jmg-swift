//
//  AddNewViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

class AddNewViewModel {
    
    // MARK: Properties
    private let repository: BookRepositoryType
    
    // MARK: Inizialization
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    // MARK: API Requests
    func addBook(book: NewBook, onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        repository.postBook(book: book, onSuccess: { [weak self] in
            onSuccess()
        }, onError: { _ in
            onError()
        })

    }
    
}
