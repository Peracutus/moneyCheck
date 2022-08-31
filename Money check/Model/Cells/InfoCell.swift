//
//  InfoCell.swift
//  Money check
//
//  Created by Roman on 04.11.2021.
//
///trashcode
///
import UIKit
import SwiftUI

class InfoCell: UICollectionViewCell {

    static let reuseId = "cellInfo"
    
    private let bgView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Center text"
        label.textAlignment = .center
        label.font = .avenirNextDemiBold20()
        return label
    }()
    
    let labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " Join to private club of elite customers will get you into select drawings and giveaways. "
        label.numberOfLines = 10
        label.textAlignment = .center
        label.font = .avenirNext14()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {

        addSubview(bgView)
        addSubview(label)
        addSubview(labelDescription)
        
        bgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        bgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        bgView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        label.topAnchor.constraint(equalTo: bgView.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true

        labelDescription.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        labelDescription.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        labelDescription.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
