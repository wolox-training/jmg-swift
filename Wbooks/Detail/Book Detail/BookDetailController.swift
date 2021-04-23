//
//  BookDetailController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

final class BookDetailController: UIViewController {

    // MARK: Properties
    private lazy var bookDetailView: BookDetailView = BookDetailView()
    let viewModel: BookDetailViewModel

    // MARK: Lifecycle methods
    override func loadView() {
        view = bookDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupRentButton()
        setupAddToWishlistButton()
    }
    
    func setupView() {
        bookDetailView.addToWishlistButton.setSecondaryStyle()
        if viewModel.status == "Available" {
            bookDetailView.rentButton.setMainStyle()
        } else {
            bookDetailView.rentButton.setUnavailableStyle()
        }
    }
    
    func setupRentButton() {
        bookDetailView.rentButton.addTarget(self, action: #selector(rentButtonTapped), for: .touchUpInside)
    }
    
    func setupAddToWishlistButton() {
        bookDetailView.addToWishlistButton.addTarget(self, action: #selector(addToWishlistButtonTapped), for: .touchUpInside)
    }

    // MARK: Initializers
    init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
        bookDetailView.setup(with: viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc func rentButtonTapped() {
        // if unavailable show alert
        // if available request to https://ios-training-backend.herokuapp.com/api/v1/users/$user_id/rents
    }
    
    @objc func addToWishlistButtonTapped() {
        print("Book added to the wishlist")
        bookDetailView.addToWishlistButton.setUnavailableStyle()
        bookDetailView.addToWishlistButton.isEnabled = false
    }
    
}
