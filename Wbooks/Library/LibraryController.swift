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
        
    var booksArray : Array = [["book_cover" : UIImage(named: "BookCover1")!, "book_title" : "A Little Bird Told Me", "book_author" : "Timothy Cross"], ["book_cover" : UIImage(named: "BookCover2")!, "book_title" : "When the Doves Disappeared", "book_author" : "Sofi Oksanen"], ["book_cover" : UIImage(named: "BookCover3")!, "book_title" : "The Best Book in the World", "book_author" : "Peter Sjernstrom"], ["book_cover" : UIImage(named: "BookCover4")!, "book_title" : "Be Creative", "book_author" : "Tony Alcazar"], ["book_cover" : UIImage(named: "BookCover5")!, "book_title" : "Redesign the Web", "book_author" : "Liliana Castilla"]]
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "CustomCell", bundle: nil)
        libraryView.booksTable.register(nib, forCellReuseIdentifier: "CustomCell")
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
        return 100
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let dict = booksArray[indexPath.row]
        
        cell.imgBookCover.image = dict["book_cover"] as? UIImage
        cell.lblBookTitle.text = dict["book_title"] as? String
        cell.lblBookAuthor.text = dict["book_author"] as? String
        
        return cell
    }
}
