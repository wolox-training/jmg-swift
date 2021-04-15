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
    
    var libraryCellViewModel: LibraryCellViewModel! {
        didSet {
            titleLabel.text = libraryCellViewModel.title
            authorLabel.text = libraryCellViewModel.author
            coverImage.image = libraryCellViewModel.cover
        }
    }
    
    @IBOutlet weak var cellView: UIView! {
        didSet {
            cellView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    // MARK: Actions
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.backgroundView = UIView()
        self.selectedBackgroundView = UIView()
    }
    
    // MARK: Public interface
    func setup(with viewModel: LibraryCellViewModel) {
        coverImage.image = viewModel.cover
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
    }
    
}
