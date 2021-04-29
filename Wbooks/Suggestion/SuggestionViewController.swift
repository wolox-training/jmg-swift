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
    
    // MARK: Inizializers
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
        setupTextFields()
    }
    
    override func loadView() {
        view = suggestionView
        setupNavBar()
    }
    
    func setupView() {
        navigationItem.leftBarButtonItem = navigationItem.backBarButtonItem
        suggestionView.submitButton.setMainStyle()
        suggestionView.submitButton.setTitle(NSLocalizedString("ADDNEW_VIEW.SUBMIT_BUTTON_TITLE", comment: ""), for: .normal)
    }
    
    func setupTextFields() {
        suggestionView.titleInput.setupTextField()
        suggestionView.titleInput.placeholder = NSLocalizedString("ADDNEW_VIEW.TITLE_INPUT_PLACEHOLDER", comment: "")
        suggestionView.authorInput.setupTextField()
        suggestionView.authorInput.placeholder = NSLocalizedString("ADDNEW_VIEW.AUTHOR_INPUT_PLACEHOLDER", comment: "")
        suggestionView.yearInput.setupTextField()
        suggestionView.yearInput.placeholder = NSLocalizedString("ADDNEW_VIEW.YEAR_INPUT_PLACEHOLDER", comment: "")
        suggestionView.topicInput.setupTextField()
        suggestionView.topicInput.placeholder = NSLocalizedString("ADDNEW_VIEW.TOPIC_INPUT_PLACEHOLDER", comment: "")
        suggestionView.descriptionInput.setupTextField()
        suggestionView.descriptionInput.placeholder = NSLocalizedString("ADDNEW_VIEW.DESCRIPTION_INPUT_PLACEHOLDER", comment: "")
    }
    
    func setupNavBar() {
        navigationItem.title = NSLocalizedString("ADDNEW_VIEW.TITLE", comment: "Main title at the top of the book suggestion view")
    }
    
}
