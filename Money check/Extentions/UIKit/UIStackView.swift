//
//  UIStackView.swift
//  Money check
//
//  Created by Roman on 23.09.2021.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = true
        self.alignment = .fill
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
