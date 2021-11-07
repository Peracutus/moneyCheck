//
//  HeaderTableView.swift
//  Money check
//
//  Created by Roman on 02.10.2021.
//

import UIKit
import EasyPeasy

class HeaderTableViewCell: UITableViewHeaderFooterView {
   
    private let headerLabel = UILabel(text: "Header", font: .avenirNextDemiBold20())
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
        
}
    func headerConfigure(nameArray: [String], section: Int) {
        headerLabel.text = nameArray[section]
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        self.addSubview(headerLabel)
        headerLabel.easy.layout(Left(25), Bottom())
    }
}
