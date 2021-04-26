//
//  BookDetailView.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

class BookDetailView: NibView {
    
    // MARK: Properties
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
    }
    
    // MARK: Public interface
    func setup (with viewModel: BookDetailViewModel) {
        let wishlistButtonText = NSLocalizedString("DETAIL_VIEW.WISHLIST_BUTTON_TITLE", comment: "Title for the 'Add to wishlist' button in the book detail view")
        let rentButtonText = NSLocalizedString("DETAIL_VIEW.RENT_BUTTON_TITLE", comment: "Title for the 'Rent' button in the book detail view")
        
        coverImage.load(stringURL: viewModel.cover)
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        yearLabel.text = viewModel.year
        genreLabel.text = viewModel.genre
        
        displayAvailability(with: viewModel)
        
        addToWishlistButton.setTitle(wishlistButtonText, for: .normal)
        rentButton.setTitle(rentButtonText, for: .normal)
    }
    
    private func displayAvailability(with viewModel: BookDetailViewModel) {
        if viewModel.isAvailable() {
            availabilityLabel.text = NSLocalizedString("DETAIL_VIEW.BOOK_IS_AVAILABLE", comment: "Label text when a book is available for rent")
            availabilityLabel.textColor = UIColor.availableGreen
        } else {
            availabilityLabel.text = NSLocalizedString("DETAIL_VIEW.BOOK_IS_UNAVAILABLE", comment: "Label text when a book is not available for rent")
            availabilityLabel.textColor = UIColor.unavailableRed
        }
    }
    
}
