//
//  DetailViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Properties
    private lazy var detailView: DetailView = DetailView()
    private var viewModel = DetailViewModel()
    private let bookDetailController = BookDetailController()
    
    // MARK: Initializers
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        load(childViewController: bookDetailController, into: detailView.bookDetailContainer)
    }
    
    override func loadView() {
        view = detailView
        setupNavBar()
    }

    private func setupNavBar() {
        navigationItem.title = NSLocalizedString("DETAIL_VIEW.TITLE", comment: "Main title at the top of the book detail view")
    }

}
