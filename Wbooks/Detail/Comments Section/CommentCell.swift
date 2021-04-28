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
    @IBOutlet weak var userImage: UIImageView! {
        didSet {
            userImage.layer.cornerRadius = userImage.frame.height/2
            userImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    // MARK: Lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        request?.cancel()
        request = nil
        userImage.image = UIImage.defaultUserAvatar
    }
    
    // MARK: Public interface
    func setup(with viewModel: CommentCellViewModel) {
        commentLabel.text = viewModel.text
        loadUser(viewModel: viewModel)
    }
    
    // MARK: Actions
    private func loadUser(viewModel: CommentCellViewModel) {
        viewModel.getUser(onSuccess: { [weak self] in 
            self?.request = self?.userImage.load(stringURL: viewModel.image)
            self?.nameLabel.text = viewModel.name
        }, onError: {
            return
        })
    }
    
}
