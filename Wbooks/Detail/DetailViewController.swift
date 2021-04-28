//
//  DetailViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

final class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    private lazy var detailView: DetailView = DetailView()
    private var viewModel: DetailViewModel
    private let bookDetailsController: BookDetailController

    // MARK: Initializers
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        let bookDetailsViewModel = viewModel.createBookDetailsViewModel()
        bookDetailsController = BookDetailController(viewModel: bookDetailsViewModel)
        super.init(nibName: .none, bundle: .none)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        load(childViewController: bookDetailsController, into: detailView.bookDetailContainer)
        loadComments()
        
    }

    override func loadView() {
        view = detailView
        setupNavBar()
    }

    private func setupNavBar() {
        navigationItem.title = NSLocalizedString("DETAIL_VIEW.TITLE", comment: "Main title at the top of the book detail view")
    }
    
    private func setupView() {
        let nib = UINib(nibName: "CommentCell", bundle: nil)
        detailView.commentsTable.register(nib, forCellReuseIdentifier: CommentCell.identifier)
        detailView.commentsTable.delegate = self
        detailView.commentsTable.dataSource = self
    }
    
    func loadComments() {
        viewModel.getComments(onSuccess: {[weak self] in
            self?.detailView.commentsTable.reloadData()
        }, onError: { 
            let errorMessage = NSLocalizedString("ALERT_BOX.ERROR_MESSAGE", comment: "Message detailing an error in the alert box")
            self.displayErrorAlert(message: errorMessage)
        })
    }
    
    // MARK: UITableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commentCount
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as? CommentCell else {
            return CommentCell()
        }

        let cellViewModel = viewModel.createCommentCellViewModel(for: indexPath.row)
        cell.setup(with: cellViewModel)

        return cell
    }
    
    // MARK: Actions
    private func displayErrorAlert(message: String) {
        let errorTitle = NSLocalizedString("ALERT_BOX.TITLE", comment: "Title for the error alert box")
        let errorDismiss = NSLocalizedString("ALERT_BOX.BUTTON", comment: "Text for the dismiss button on the alert box")
        
        let alertController = UIAlertController(title: errorTitle, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: errorDismiss, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }

}
