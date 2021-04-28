//
//  DetailView.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

final class DetailView: NibView {
    
    // MARK: Properties
    @IBOutlet weak var bookDetailContainer: UIView! {
        didSet {
            bookDetailContainer.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var commentsTable: UITableView! {
        didSet {
            commentsTable.layer.cornerRadius = 10
        }
    }
    
}
