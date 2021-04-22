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
    let wishlistButtonText = NSLocalizedString("DETAIL_VIEW.WISHLIST_BUTTON_TITLE", comment: "")
    let rentButtonText = NSLocalizedString("DETAIL_VIEW.RENT_BUTTON_TITLE", comment: "")

    init(book: Book) {
        self.book = book
    }

    // MARK: Presentation

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

}
