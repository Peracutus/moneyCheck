//
//  UIButton.swift
//  Money check
//
//  Created by Roman on 24.09.2021.
//

import UIKit

extension UIButton {
    convenience init(color: UIColor,name: String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.setTitle(name, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.titleLabel?.textAlignment = .center
    }
}
