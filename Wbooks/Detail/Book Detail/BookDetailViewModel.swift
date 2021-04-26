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
    private let repository: RentRepositoryType

    // MARK: Inizialization
    init(book: Book, repository: RentRepositoryType) {
        self.book = book
        self.repository = repository
    }

    // MARK: Presentation
    var id: Int {
        book.id
    }
    
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

    var status: String{
        book.status
    }
    
    // MARK: API Requests
    func rentBook(with params: [String: Any], onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        repository.postRent(with: params) {
            onSuccess()
        } onError: { error in
            onError(error)
        }
    }

}
