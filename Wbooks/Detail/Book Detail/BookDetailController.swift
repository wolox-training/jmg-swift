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
    
}
