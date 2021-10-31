//
//  UILabel.swift
//  Money check
//
//  Created by Roman on 26.09.2021.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, alignment: NSTextAlignment = .left) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = font
        self.textColor = .black
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
    }
}
