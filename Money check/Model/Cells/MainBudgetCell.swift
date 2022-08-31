//
//  CustomCell.swift
//  Money check
//
//  Created by Roman on 01.08.2021.
//

import UIKit

final class MainBudgetCell: UITableViewCell {
    
    var titleLabel = UILabel(text: "", font: .avenirNextDemiBold20(), alignment: .left)
    var dateLabel = UILabel()
    var amountLabel = UILabel(text: "1000", font: .avenirNextDemiBold20(), alignment: .right)
    var categoryLabel = UILabel()
    var categoryImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "plus_icon").withTintColor(.black))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.size.height -= 10
            super.frame = newFrame
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        clipsToBounds = true
        selectionStyle = .none
        
        [titleLabel, dateLabel, amountLabel, categoryLabel, categoryImageView, categoryLabel].forEach { item in
            contentView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        categoryImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        categoryImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        categoryImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true

        titleLabel.leftAnchor.constraint(equalTo: categoryImageView.rightAnchor, constant: 15).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
       
        categoryLabel.leftAnchor.constraint(equalTo: categoryImageView.rightAnchor, constant: 15).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
       
        amountLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        amountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
       
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
