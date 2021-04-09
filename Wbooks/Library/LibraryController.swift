//
//  LibraryController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 08/04/2021.
//

import Foundation
import UIKit

final class LibraryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    private lazy var libraryView: LibraryView = LibraryView()
    
    private let booksArray : [Book] = [Book(cover: UIImage(named: "BookCover1")!, title: "A Little Bird Told Me", author: "Timothy Cross"), Book(cover: UIImage(named: "BookCover2")!, title: "When the Doves Disappeared", author: "Sofi Oksanen"), Book(cover: UIImage(named: "BookCover3")!, title: "The Best Book in the World", author: "Peter Sjernstrom"), Book(cover: UIImage(named: "BookCover4")!, title: "Be Creative", author: "Tony Alcazar"), Book(cover: UIImage(named: "BookCover5")!, title: "Redesign the Web", author: "Liliana Castilla")]
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        libraryView.booksTable.register(nib, forCellReuseIdentifier: CustomCell.identifier)
        libraryView.booksTable.delegate = self
        libraryView.booksTable.dataSource = self
    }
    
    override func loadView() {
        view = libraryView
    }
    
    // MARK: UITableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksArray.count
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        let book = booksArray[indexPath.row]
        
        cell.backgroundColor = .clear
        cell.backgroundView = UIView()
        cell.selectedBackgroundView = UIView()
        
        cell.imgBookCover.image = book.cover
        cell.lblBookTitle.text = book.title
        cell.lblBookAuthor.text = book.author
        
        return cell
    }
}
