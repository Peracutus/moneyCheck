//
//  UITextField.swift
//  Money check
//
//  Created by Roman on 24.09.2021.
//

import UIKit
import EasyPeasy

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
        self.keyboardType = .numbersAndPunctuation
        self.translatesAutoresizingMaskIntoConstraints = false
        self.easy.layout(Height(40),Width(220))
    }
}
