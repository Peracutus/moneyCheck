//
//  MenuTableCell.swift
//  Money check
//
//  Created by Roman on 28.09.2021.
//

import UIKit
import EasyPeasy
class MenuTableCell: UITableViewCell {

    static let reuseId = "MenuTableCell"
    
    let iconImageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let myLabel =  UILabel(text: "Custom text", font: .avenirNextDemiBold20(), alignment: .center)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(iconImageView)
        addSubview(myLabel)
        myLabel.textColor = .white
        backgroundColor = .clear
        
        iconImageView.easy.layout(CenterY(), Height(30), Width(30), Left(12))
        myLabel.easy.layout(CenterY(), Left(12).to(iconImageView))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
