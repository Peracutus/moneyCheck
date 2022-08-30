//
//  CategoriesCollectionCell.swift
//  Money check
//
//  Created by Roman on 28.09.2021.
//

import UIKit
import EasyPeasy

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
        imageCategory.easy.layout(Top(5), CenterX(), Height(70), Width(70))
        nameLabel.easy.layout( Left(5), Right(5), Height(30), Bottom().to(contentView.safeAreaLayoutGuide, .bottom))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

