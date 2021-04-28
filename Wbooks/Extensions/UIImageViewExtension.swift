//
//  UIImageViewExtension.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 19/04/2021.
//

import UIKit

extension UIImageView {
    func load(stringURL: String) -> DispatchWorkItem? {
        guard let url = URL(string: stringURL) else {
            return nil
        }
        var workItem: DispatchWorkItem?

        workItem = DispatchWorkItem { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    if let item = workItem, !item.isCancelled {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
        DispatchQueue.global().async(execute: workItem!)
        return workItem
    }

}
