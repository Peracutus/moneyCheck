//
//  CustomView.swift
//  Money check
//
//  Created by Roman on 28.09.2021.
//

import UIKit

class CustomView: UIView {

    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 15
        layer.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        layer.borderWidth = 2
        layer.masksToBounds = true
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
