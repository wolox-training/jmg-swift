//
//  BookDetailController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

final class BookDetailController: UIViewController {
    private lazy var bookDetailView: BookDetailView = BookDetailView()
    private let viewModel: BookDetailViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
    }
    
    override func loadView() {
        view = bookDetailView
    }
    
    // MARK: Initializers
    init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
