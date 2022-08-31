//
//  ColorTVCell.swift
//  Money check
//
//  Created by Roman on 06.10.2021.
//

import UIKit

class ColorTVCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setConstraints()
    
}
    func cellConfigure(indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: bgView.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.2705882353, blue: 0.3529411765, alpha: 1)
        case 1: bgView.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.6274509804, blue: 0.2509803922, alpha: 1)
        case 2: bgView.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.8588235294, blue: 0.05098039216, alpha: 1)
        case 3: bgView.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.8745098039, blue: 0.3607843137, alpha: 1)
        case 4: bgView.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.3450980392, blue: 0.9215686275, alpha: 1)
        case 5: bgView.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.3254901961, blue: 0.3803921569, alpha: 1)
        default:
            bgView.backgroundColor =  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        self.addSubview(bgView)
        bgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bgView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        bgView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

