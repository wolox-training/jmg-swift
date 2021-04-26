//
//  CommentCell.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 26/04/2021.
//

import UIKit

class CommentCell: UITableViewCell {
    
    // MARK: Properties
    static let identifier = "CommentCell"
    private var request: DispatchWorkItem?
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    // MARK: Actions
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        // self.backgroundView = UIView()
        // self.selectedBackgroundView = UIView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        request?.cancel()
        request = nil
        userImage.image = UIImage(named: "User2")
    }
    
    // MARK: Public interface
    func setup(with viewModel: CommentCellViewModel) {
        request = userImage.load(stringURL: viewModel.image)
        nameLabel.text = viewModel.user
        commentLabel.text = viewModel.text
    }
    
}
