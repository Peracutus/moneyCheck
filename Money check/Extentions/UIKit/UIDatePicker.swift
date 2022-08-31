//
//  UIDatePicker.swift
//  Money check
//
//  Created by Roman on 26.09.2021.
//
import UIKit

extension UIDatePicker {
    convenience init(date: UIDatePicker.Mode) {
        self.init()
        self.datePickerMode = date
        self.setValue(UIColor.black, forKeyPath: "textColor")
        self.setValue(0.9, forKeyPath: "alpha")
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        
        self.tintColor = .black
        self.layer.cornerRadius = 5
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.borderWidth = 1
        self.locale = Locale.current
        self.timeZone = .current
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

