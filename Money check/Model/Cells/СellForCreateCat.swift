//
//  cellForCreateCat.swift
//  Money check
//
//  Created by Roman on 29.09.2021.
//

import UIKit

final class СellForCreateCat: UICollectionViewCell {
    
    static let identifier = "CellForCreateCat"
    
    var imageCategory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        imageCategory.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageCategory.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageCategory.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageCategory.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
