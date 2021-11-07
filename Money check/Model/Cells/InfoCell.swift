//
//  InfoCell.swift
//  Money check
//
//  Created by Roman on 04.11.2021.
//

import UIKit
import EasyPeasy
import Lottie
import SwiftUI

class InfoCell: UICollectionViewCell {

    static let reuseId = "cellInfo"
    
    var animationView: AnimationView = {
        let animationView = AnimationView()
        let animation = Animation.named("case")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.loopMode = .loop
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
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
        //label.lineBreakMode = .byTruncatingMiddle
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
        bgView.addSubview(animationView)
        bgView.easy.layout(Top(10).to(safeAreaLayoutGuide, .top), Left(), Right())
        
        bgView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        animationView.easy.layout(CenterX(), CenterY(), Height().like(bgView, .height))
        label.easy.layout(Top().to(bgView, .bottom), Left(20), Right(20))
        labelDescription.easy.layout(Top(20).to(label, .bottom), Left(20), Right(20))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
