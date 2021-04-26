//
//  CommentCellViewModel.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 26/04/2021.
//

import UIKit

struct CommentCellViewModel {
    
    // MARK: Properties
    private let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    // MARK: Presentation
    var text: String {
        return comment.content
    }
    
}
