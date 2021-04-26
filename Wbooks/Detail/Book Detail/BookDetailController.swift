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
        if viewModel.isAvailable() {
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
        if viewModel.isAvailable() {
            viewModel.rentBook(onSuccess: {
                self.displaySuccessAlert()
            }, onError: { _ in
                let errorMessage = NSLocalizedString("ALERT_BOX.ERROR_MESSAGE", comment: "Message detailing an error in the alert box")
                self.displayErrorAlert(message: errorMessage)
            })
        } else {
            let errorMessage = NSLocalizedString("ALERT_BOX.BOOK_UNAVAILABLE_MESSAGE", comment: "Message detailing an error in the alert box")
            displayErrorAlert(message: errorMessage)
        }
        
    }
    
    @objc func addToWishlistButtonTapped() {
        bookDetailView.addToWishlistButton.setUnavailableStyle()
        bookDetailView.addToWishlistButton.isEnabled = false
    }
    
    private func displayErrorAlert(message: String) {
        let errorTitle = NSLocalizedString("ALERT_BOX.TITLE", comment: "Title for the error alert box")
        let errorDismiss = NSLocalizedString("ALERT_BOX.BUTTON", comment: "Text for the dismiss button on the alert box")
        
        let alertController = UIAlertController(title: errorTitle, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: errorDismiss, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    
    private func displaySuccessAlert() {
        let rentSuccessMessage = NSLocalizedString("ALERT_BOX.BOOK_RENTED", comment: "Message detailing an error in the alert box")
        let errorDismiss = NSLocalizedString("ALERT_BOX.BUTTON", comment: "Text for the dismiss button on the alert box")

        let alertController = UIAlertController(title: nil, message: rentSuccessMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: errorDismiss, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    
}
