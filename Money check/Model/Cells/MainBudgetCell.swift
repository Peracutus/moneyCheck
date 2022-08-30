//
//  CustomCell.swift
//  Money check
//
//  Created by Roman on 01.08.2021.
//

import UIKit
import EasyPeasy

final class MainBudgetCell: UITableViewCell {
    
    var titleLabel = UILabel(text: "", font: .avenirNextDemiBold20(), alignment: .left)
    var dateLabel = UILabel()
    var amountLabel = UILabel(text: "1000", font: .avenirNextDemiBold20(), alignment: .right)
    var categoryLabel = UILabel()
    var categoryImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "plus_icon").withTintColor(.black))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(amountLabel)
        addSubview(categoryImageView)
        addSubview(categoryLabel)
        
        categoryImageView.easy.layout(Height(60), Width(60), Left(15),CenterY())
        categoryLabel.easy.layout(Left(15).to(categoryImageView, .right), Bottom(10))
        titleLabel.easy.layout(Left(15).to(categoryImageView, .right), Top(10))
        amountLabel.easy.layout(Right(15), Top(10), Bottom().to(dateLabel, .top))
        dateLabel.easy.layout(Right(15), Bottom(10))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
