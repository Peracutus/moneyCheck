//
//  TasksVCCell.swift
//  Money check
//
//  Created by Roman on 26.09.2021.
//
///trashcode
///
import UIKit

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
        taskLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        taskLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        taskLabel.rightAnchor.constraint(equalTo: readyButton.rightAnchor, constant: -15).isActive = true
        taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        readyButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        readyButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        readyButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        readyButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
}
