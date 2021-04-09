//
//  CustomCell.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 08/04/2021.
//

import UIKit

class LibraryCell: UITableViewCell {

    // MARK: Properties
    static let identifier = "LibraryCell"
    
    
    @IBOutlet weak var cellView: UIView! {
        didSet {
            cellView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
}
