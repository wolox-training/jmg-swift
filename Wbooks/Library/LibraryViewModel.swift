//
//  LibraryViewModel.swift
//  Wbooks
//
//  Created by Gabriel Mazzei on 15/04/2021.
//

import Foundation
import UIKit


struct LibraryViewModel {
    
    // MARK: - Properties
    
    private let booksArray : [Book] = [
        Book(cover: UIImage(named: "BookCover1")!,
             title: "A Little Bird Told Me",
             author: "Timothy Cross"),
        Book(cover: UIImage(named: "BookCover2")!,
             title: "When the Doves Disappeared",
             author: "Sofi Oksanen"),
        Book(cover: UIImage(named: "BookCover3")!,
             title: "The Best Book in the World",
             author: "Peter Sjernstrom"),
        Book(cover: UIImage(named: "BookCover4")!,
             title: "Be Creative",
             author: "Tony Alcazar"),
        Book(cover: UIImage(named: "BookCover5")!,
             title: "Redesign the Web",
             author: "Liliana Castilla")]
    
    // MARK: - Presentation
    
    var bookCount: Int {
        booksArray.count
    }
    
    // MARK: - Public interface
    
    func createLibraryCellViewModel(for index: Int) -> LibraryCellViewModel {
        let book = booksArray[index]
        return LibraryCellViewModel(book: book)
    }
}
