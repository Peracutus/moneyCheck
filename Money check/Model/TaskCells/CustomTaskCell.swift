//
//  CustomTaskCell.swift
//  Money check
//
//  Created by Roman on 02.10.2021.
//

import UIKit
import EasyPeasy

class CustomTaskCell: UITableViewCell {
    
    let bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9888455243, green: 1, blue: 0.9262188061, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return view
    }()
    
    let label = UILabel(text: "Print", font: .avenirNext20(), alignment: .center)
    let cellNameArray = [["Date"],["Date"],["Date"],["Date"]]
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setConstraints()
        
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setConstraints() {
        
        self.addSubview(bgView)
        self.addSubview(label)
        bgView.easy.layout(Top(), Left(15), Right(15), Bottom())
        label.easy.layout(CenterY(), Left(25))
    }
}
