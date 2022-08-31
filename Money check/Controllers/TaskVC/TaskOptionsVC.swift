//
//  TaskTableView.swift
//  Money check
//
//  Created by Roman on 02.10.2021.
//
///trashcode

import UIKit

class TaskOptionsVC: UITableViewController {
    
    private let idTaskCell = "IdTaskCellOptions"
    private let idTaskHeader = "IdTaskHeader"
    private let headerName = ["Date", "Name", "Task", "Color"]
    private var taskModel = TaskModel()
    var hexColorCell = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        view.backgroundColor = UIColor(named: "bgColor")
        tableView.bounces = false
        tableView.register(CustomTaskCell.self, forCellReuseIdentifier: idTaskCell)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: idTaskHeader)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAction))
        
        title = "Option Tasks"
    }
    
    @objc private func saveAction() {
        if taskModel.taskDate == nil || taskModel.taskName == "" {
            alertSave(title: "Error", message: "Requered fields: Date and Name")
        } else {
        
        taskModel.taskColor = hexColorCell
        
//        RealmManager.shared.saveTaskModel(model: taskModel)
        taskModel = TaskModel()
            alertSave(title: "Success ", message: nil)
            tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTaskCell) as! CustomTaskCell
        let cellNameArray = [["Set a date"],["Write the name"],["describe your goal"],[""]]
        let color = UIColor().colorFromHex(hexColorCell)
        cell.bgView.backgroundColor = (indexPath.section == 3 ? color : .white)
        cell.label.text = cellNameArray[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idTaskHeader) as! HeaderTableViewCell
        header.headerConfigure(nameArray: headerName, section: section)
        header.contentView.backgroundColor = .white
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CustomTaskCell
        switch indexPath {
        case [0,0]: alertDate(label: cell.label) {  (numberWeekday, date) in
            self.taskModel.taskDate = date
            self.taskModel.taskWeekday = numberWeekday
        }
        case [1,0]: alertForCellName(label: cell.label, name: "Name", placeholder: "Enter name") { text in
            self.taskModel.taskName = text
        }
        case [2,0]: alertForCellName(label: cell.label, name: "Task", placeholder: "Enter your task") { text in
            self.taskModel.taskDescription = text
        }
        case [3,0]:
            let color = ColorVC()
            navigationController?.pushViewController(color, animated: true)
        default:
            print("Error")
        }
    }
}
