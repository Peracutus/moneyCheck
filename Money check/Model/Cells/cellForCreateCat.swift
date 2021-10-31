//
//  cellForCreateCat.swift
//  Money check
//
//  Created by Roman on 29.09.2021.
//

import UIKit
import EasyPeasy

class cellForCreateCat: UICollectionViewCell {
    
    static let identifier = "CellForCreateCat"
    
     var imageCategory: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageCategory)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        clipsToBounds = true
        imageCategory.easy.layout(CenterY(), CenterX(), Height(100), Width(100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
