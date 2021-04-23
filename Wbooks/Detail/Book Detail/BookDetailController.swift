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
    let errorTitle = NSLocalizedString("ALERT_BOX.TITLE", comment: "Title for the error alert box")
    let rentErrorMessage = NSLocalizedString("ALERT_BOX.ERROR_MESSAGE", comment: "Message detailing an error in the alert box")
    let errorMessage = NSLocalizedString("ALERT_BOX.BOOK_UNAVAILABLE_MESSAGE", comment: "Message detailing an error in the alert box")
    let rentSuccessMessage = NSLocalizedString("ALERT_BOX.BOOK_RENTED", comment: "Message detailing an error in the alert box")
    let errorDismiss = NSLocalizedString("ALERT_BOX.BUTTON", comment: "Text for the dismiss button on the alert box")

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
        if viewModel.status == "Available" {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-mm-dd"
            let fromDate = Date()
            let toDate = Calendar.current.date(byAdding: .day, value: 1, to: fromDate)
            let params: [String : Any] = ["user_id" : "10",
                          "book_id" : viewModel.id,
                          "fromDate" : formatter.string(from: fromDate),
                          "toDate" : formatter.string(from: toDate!)]
            
            viewModel.rentBook(with: params, onSuccess: {
                self.displayAlert(message:
                                self.rentSuccessMessage)
            }, onError: {_ in
                self.displayAlert(message: self.errorMessage)
            })
        } else {
            displayAlert(message: self.rentErrorMessage)
        }
        
    }
    
    @objc func addToWishlistButtonTapped() {
        bookDetailView.addToWishlistButton.setUnavailableStyle()
        bookDetailView.addToWishlistButton.isEnabled = false
    }
    
    func displayAlert(message: String) {
        let alertController = UIAlertController(title: self.errorTitle, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: self.errorDismiss, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    
}
