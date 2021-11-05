//
//  TasksVCCell.swift
//  Money check
//
//  Created by Roman on 26.09.2021.
//

import UIKit
import EasyPeasy
class TasksVCCell: UITableViewCell {
    
    var titleLabel = UILabel(text: "Programming", font: .avenirNextDemiBold20())
    var taskLabel = UILabel(text: "Let's add something new in swift!", font: .avenirNext14())
    let readyButton: UIButton = {
       let addLabel = UIButton()
        addLabel.tintColor = .black
        addLabel.setBackgroundImage(UIImage(systemName: "swift"), for: .normal)
        addLabel.layer.cornerRadius = 20
        return addLabel
    }()
    
    weak var  cellTaskDelegate: PressReadyTaskButtonProtocol?
    var index: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        layer.cornerRadius = 10
        clipsToBounds = true
        self.selectionStyle = .none
        taskLabel.numberOfLines = 3
        setConstraints()
        
        readyButton.addTarget(self, action: #selector(readyButTapped), for: .touchUpInside)
    }
    
    func configure(model: TaskModel) {
        titleLabel.text = model.taskName
        taskLabel.text = model.taskDescription
        backgroundColor = UIColor().colorFromHex("\(model.taskColor)")
        
        if model.taskReady {
            readyButton.setBackgroundImage(UIImage(systemName: "chevron.down.circle.fill"), for: .normal)
        } else {
            readyButton.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        }
    }
    
    @objc private func readyButTapped() {
        guard let index = index else {return}
        cellTaskDelegate?.readyButtonTapped(indexPath: index)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        self.contentView.addSubview(readyButton)
        self.addSubview(titleLabel)
        self.addSubview(taskLabel)
        taskLabel.easy.layout(Left(15),Top().to(titleLabel, .bottom), Bottom(10), Right().to(readyButton))
        titleLabel.easy.layout(Left(15), Top(5))
        readyButton.easy.layout(Right(15), Top(5), Height(70), Width(70))
    }
}
