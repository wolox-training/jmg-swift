//
//  SuggestionViewController.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

class SuggestionViewController: UIViewController {
    
    // MARK: Properties
    private lazy var suggestionView: SuggestionView = SuggestionView()
    private var viewModel: SuggestionViewModel
    
    // MARK: Inizialization
    init(viewModel: SuggestionViewModel) {
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
    }
    
    override func loadView() {
        view = suggestionView
        setupNavBar()
    }
    
    func setupView() {
        suggestionView.submitButton.setMainStyle()
    }
    
    func setupNavBar() {
        navigationItem.title = NSLocalizedString("SUGGESTION_VIEW.TITLE", comment: "Main title at the top of the book suggestion view")
    }
    
}
