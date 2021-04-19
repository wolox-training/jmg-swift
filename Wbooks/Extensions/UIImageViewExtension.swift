//
//  UIImageViewExtension.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 19/04/2021.
//

import UIKit

extension UIImageView {
    func load(stringURL: String) {
        let url = URL(string: stringURL)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }

}
