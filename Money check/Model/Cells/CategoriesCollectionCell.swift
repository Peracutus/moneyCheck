//
//  CategoriesCollectionCell.swift
//  Money check
//
//  Created by Roman on 28.09.2021.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {
    
    var categoryWithImg: CustomData? {
        didSet {
            guard let data = categoryWithImg else {return}
            nameLabel.text = data.catName
            imageCategory.image = data.image
        }
    }
    
    static let identifier = "CategoriesCollectionCell"
    
    let imageCategory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "Hearts")
        return imageView
    }()
    
    let nameLabel = UILabel(text: "Transport", font: .avenirNextDemiBold20(), alignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageCategory)
        contentView.addSubview(nameLabel)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        clipsToBounds = true
        nameLabel.numberOfLines = 2
        
        imageCategory.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageCategory.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageCategory.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageCategory.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

