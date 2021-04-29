//
//  SuggestionView.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 28/04/2021.
//

import UIKit

final class SuggestionView: NibView {
    
    // MARK: Properties
    @IBOutlet weak var formContainer: UIView! {
        didSet {
            formContainer.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var submitButton: UIButton!

    
}
