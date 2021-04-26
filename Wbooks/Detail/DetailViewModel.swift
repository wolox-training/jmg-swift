//
//  DetailViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

class DetailViewModel {
    
    var commentsArray: [Comment] = []
    
    // MARK: Properties
    private let book: Book
    private let rentRepository: RentRepositoryType
    private let commentRepository: CommentRepositoryType
    
    var commentCount: Int {
        return commentsArray.count
    }
    
    // MARK: Inizialization
    init(book: Book, rentRepository: RentRepositoryType = BookRepository(), commentRepository: CommentRepositoryType = BookRepository()) {
        self.book = book
        self.rentRepository = rentRepository
        self.commentRepository = commentRepository
    }
    
    // MARK: Public interface
    func createBookDetailsViewModel() -> BookDetailViewModel {
        return BookDetailViewModel(book: book, repository: self.rentRepository)
    }
    
    func createCommentCellViewModel(for index: Int) -> CommentCellViewModel {
        let comment = commentsArray[index]
        return CommentCellViewModel(comment: comment)
    }
    
    // MARK: API Requests
    func getComments(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        commentRepository.fetchComments(bookID: book.id, onSuccess: { [weak self] (comments) in
            self?.commentsArray = comments
            onSuccess()
        }, onError: { _ in
            onError()
        })

    }
    
}
