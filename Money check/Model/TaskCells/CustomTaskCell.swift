//
//  CustomTaskCell.swift
//  Money check
//
//  Created by Roman on 02.10.2021.
//
///trashcode


import UIKit

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
        bgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bgView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        bgView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25).isActive = true
    }
}
