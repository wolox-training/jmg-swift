//
//  UIImageViewExtension.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 19/04/2021.
//

import UIKit

extension UIImageView {
    func load(stringURL: String) {
        guard let url = URL(string: stringURL) else {
            print("No URL Here")
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    /* func stringToURL(stringURL: String) -> URL {
        guard let convertedString = URL(string: stringURL) else {
            return URL(string: "https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png")!
        }
        return convertedString
    }*/

}
