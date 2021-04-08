//
//  CustomCell.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 08/04/2021.
//

import UIKit

class CustomCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var imgBookCover: UIImageView!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    
    // MARK: Actions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
