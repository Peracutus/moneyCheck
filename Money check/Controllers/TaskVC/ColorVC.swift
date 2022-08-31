//
//  ColorVC.swift
//  Money check
//
//  Created by Roman on 06.10.2021.
//
///trashcode

import UIKit

class ColorVC: UITableViewController {
    
    let idColorCell = "IdColorCell"
    let idTaskHeader = "IdTaskHeader"
    let headerNameArray = ["RED","ORANGE","YELLOW","GREEN","BLUE","DEEP BLUE", "PURPLE"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Colors"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        tableView.register(ColorTVCell.self, forCellReuseIdentifier: idColorCell)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: idTaskHeader)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idColorCell) as! ColorTVCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idTaskHeader) as! HeaderTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: setColor(color: "E9455A")
        case 1:  setColor(color: "DFA040")
        case 2:  setColor(color: "DFDB0D")
        case 3:  setColor(color: "76DF5C")
        case 4:  setColor(color: "4A58EB")
        case 5:  setColor(color: "2D5361")
        case 6:  setColor(color: "8E5AF7")
        
        default:
            setColor(color: "FFFFFF")
        }
    }
    
    private func setColor(color: String) {
        let taskOptions = self.navigationController?.viewControllers[1] as? TaskOptionsVC
        taskOptions?.hexColorCell = color
        taskOptions?.tableView.reloadRows(at: [[3,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
}
