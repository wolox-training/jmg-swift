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
    private let viewTitle: String = "Library"
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
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "LibraryCell", bundle: nil)
        libraryView.booksTable.register(nib, forCellReuseIdentifier: LibraryCell.identifier)
        libraryView.booksTable.delegate = self
        libraryView.booksTable.dataSource = self
    }
    
    override func loadView() {
        view = libraryView
        setupNavBar()
    }
    
    /// Sets up the navigation bar buttons for this specific view
    private func setupNavBar() {
        navigationItem.title = viewTitle.uppercased()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "SearchButton"),
            style: .plain,
            target: self,
            action: #selector(searchTapped)
        )
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "NotificationButton"),
            style: .plain,
            target: self,
            action: #selector(notificationsTapped)
        )
    }
    
    // MARK: UITableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksArray.count
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: LibraryCell.identifier, for: indexPath) as! LibraryCell
        let book = booksArray[indexPath.row]
                
        cell.coverImage.image = book.cover
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellTapped()
    }
    
    // MARK: Navigation methods
    @objc private func notificationsTapped() {
        // Switch to notifications view
    }
    
    @objc private func searchTapped() {
        // Switch to search view
    }
    
    private func cellTapped() {
        // Transition to book detail view
    }
    
}
