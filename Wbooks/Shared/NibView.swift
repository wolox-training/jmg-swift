//
//  NibView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 18/12/2020.
//

import UIKit

class NibView: UIView {

    private var view: UIView?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    /// Setups view from .xib file
    private func xibSetup() {
        backgroundColor = .clear
        let view = loadNib()

        // use bounds not frame or it'll be offset
        view.frame = bounds

        // Adding custom subview on top of our view
        addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))

        self.view = view
    }

    /// Loads instance from nib with the same name.
    private func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not instantiate view")
        }

        return view
    }
}
