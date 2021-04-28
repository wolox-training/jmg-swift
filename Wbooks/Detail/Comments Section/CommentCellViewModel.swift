//
//  CommentCellViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 26/04/2021.
//

import UIKit

class CommentCellViewModel {
    
    // MARK: Properties
    private let comment: Comment
    private var user: User?
    let userRepository: UserRepositoryType
    
    init(comment: Comment, userRepository: UserRepositoryType = BookRepository()) {
        self.comment = comment
        self.userRepository = userRepository
    }
    
    // MARK: Presentation
    var text: String {
        return comment.content
    }
    
    var image: String {
        return user?.image ?? ""
    }
    
    var name: String {
        return user?.username ?? ""
    }
    
    // MARK: API Requests
    func getUser(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        userRepository.fetchUser(userID: comment.user_id, onSuccess: { [weak self] user in
            self?.user = user
            onSuccess()
        }, onError: { _ in
            onError()
        })
    
    }
    
}
