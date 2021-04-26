//
//  UIViewControllerExtension.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 21/04/2021.
//

import UIKit

extension UIViewController {
    /// Adds a child controller into a view of another controller
    ///
    /// - Parameters
    ///   - childViewController: the new controller to be added
    ///   - containerView: view that will hold the child controller
    func load(childViewController: UIViewController, into containerView: UIView) {
        guard let childView = childViewController.view else { return }
        childViewController.willMove(toParent: self)
        addChild(childViewController)
        childViewController.didMove(toParent: self)
        containerView.addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: containerView.topAnchor),
            childView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            childView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
}
