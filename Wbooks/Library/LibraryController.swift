//
//  LibraryController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 08/04/2021.
//

import UIKit

final class LibraryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    private lazy var libraryView: LibraryView = LibraryView()
    private var viewModel = LibraryViewModel()
    
    let errorTitle = NSLocalizedString("ALERT_BOX.TITLE", comment: "Title for the error alert box")
    let errorMessage = NSLocalizedString("ALERT_BOX.MESSAGE", comment: "Message detailing an error in the alert box")
    let errorDismiss = NSLocalizedString("ALERT_BOX.BUTTON", comment: "Text for the dismiss button on the alert box")
    
    // MARK: Initializers
    init(viewModel: LibraryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadBooks()
    }
    
    override func loadView() {
        view = libraryView
        setupNavBar()
    }
    
    /// Sets up the navigation bar buttons for this specific view
    private func setupNavBar() {
        navigationItem.title = NSLocalizedString("LIBRARY_VIEW.TITLE", comment: "Main title at the top of the library view")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "SearchButton"),
            style: .plain,
            target: self,
            action: #selector(searchTapped)
        )
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "NotificationButton"),
            style: .plain,
            target: self,
            action: #selector(notificationsTapped)
        )
    }
    
    /// Sets up the view for the table that will be displaying the books
    private func setupView() {
        let nib = UINib(nibName: "LibraryCell", bundle: nil)
        libraryView.booksTable.register(nib, forCellReuseIdentifier: LibraryCell.identifier)
        libraryView.booksTable.delegate = self
        libraryView.booksTable.dataSource = self
    }
    
    /// Gets books from an API request or displays an error message
    private func loadBooks() {
        viewModel.getBooks(onSuccess: { [weak self] in
            self?.libraryView.booksTable.reloadData()
        }, onError: { [weak self] in
            let alertController = UIAlertController(title: self?.errorTitle, message: self?.errorMessage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: self?.errorDismiss, style: .default, handler: nil))
            self?.present(alertController, animated: true)
        })
    }
    
    // MARK: UITableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bookCount
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LibraryCell.identifier, for: indexPath) as? LibraryCell else {
            return LibraryCell()
        }
        
        let cellViewModel = viewModel.createLibraryCellViewModel(for: indexPath.row)
        cell.setup(with: cellViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellTapped()
    }
    
    // MARK: Navigation methods
    @objc private func notificationsTapped() {
        // Switch to notifications view
    }
    
    @objc private func searchTapped() {
        // Switch to search view
    }
    
    private func cellTapped() {
        // Transition to book detail view
    }
    
}
