//
//  BookDetailView.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

class BookDetailView: NibView {
    
    // MARK: Properties:
    @IBOutlet weak var bookDetailViewContainer: UIView!
    
    // MARK: Actions
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .red
    }
    
}
