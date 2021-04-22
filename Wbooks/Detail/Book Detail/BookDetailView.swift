//
//  BookDetailView.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

class BookDetailView: NibView {
    
    // MARK: Properties
    let availableGreen = UIColor(red: 165, green: 205, blue: 57, alpha: 1)
    
    @IBOutlet weak var bookDetailsViewContainer: UIView! {
        didSet {
            bookDetailsViewContainer.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var addToWishlistButton: UIButton!
    @IBOutlet weak var rentButton: UIButton!
    
    // MARK: Actions
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
    }
    
    // MARK: Public interface
    func setup (with viewModel: BookDetailViewModel) {
        coverImage.load(stringURL: viewModel.cover)
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        yearLabel.text = viewModel.year
        genreLabel.text = viewModel.genre
        availabilityLabel.text = viewModel.status
        
        if viewModel.status == "Available" {
            availabilityLabel.textColor = UIColor(named: "Available Green")
        } else {
            availabilityLabel.textColor = .red
        }
        
        addToWishlistButton.setTitle(viewModel.wishlistButtonText, for: .normal)
        rentButton.setTitle(viewModel.rentButtonText, for: .normal)
    }
    
}
