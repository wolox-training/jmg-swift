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
    
    private var request: DispatchWorkItem?
    
    @IBOutlet weak var cellView: UIView! {
        didSet {
            cellView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        request?.cancel()
        request = nil
        coverImage.image = nil
    }
    
    // MARK: Actions
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.backgroundView = UIView()
        self.selectedBackgroundView = UIView()
    }
    
    // MARK: Public interface
    func setup(with viewModel: LibraryCellViewModel) {
        request = coverImage.load(stringURL: viewModel.cover)
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
    }
    
}
