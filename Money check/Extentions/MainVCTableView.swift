//
//  MainVCTableView.swift
//  Money check
//
//  Created by Roman on 05.08.2021.
//

import UIKit
import Lottie
import EasyPeasy
import RealmSwift

extension MainVC {
    
    //MARK: - Appearing footer if realm objects = 0
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return animateEmptyData()
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return RealmManager.shared.realm.objects(CellItems.self).isEmpty ? 500 : 0
    }
    
    //MARK: -  if realm object >= 1
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let label = UILabel(text: dateFormatter(path: itemDates[section], format: "dd MMMM"), font: .avenirNextDemiBold20(), alignment: .center)
        
        view.addSubview(label)
        label.easy.layout(CenterX(), Bottom())
        
        if section == 0 {
            let balanceStack = UIStackView(arrangedSubviews: [
                constans.viewWithbutton(color: .greenColor,name: "+ \(constans.separatedNumber(constans.income)) ₽",selector: #selector(butForCharts)), constans.viewWithbutton(color: .redColor, name: "- \(constans.separatedNumber(constans.expense)) ₽",selector: #selector(butForCharts))
            ],
                                           axis: .horizontal,
                                           spacing: -5,
                                           distribution: .fillEqually)
            //
            let incomeAndExpenseStack = UIStackView(arrangedSubviews: [constans.viewWithbutton(color: .blueColor, name: "Balance: \(constans.separatedNumber(constans.balance)) ₽", selector: #selector(butForCharts)), balanceStack, label], axis: .vertical, spacing: -5, distribution: .fillProportionally)
            view.addSubview(incomeAndExpenseStack)
            return RealmManager.shared.realm.objects(CellItems.self).count == 0 ? nil : view
        }
        else {
            return view
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return RealmManager.shared.realm.objects(CellItems.self).isEmpty ? 0 : 200
        } else {
            return 10
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListCell", for: indexPath) as! CustomCell
        configureCell(cell, at: indexPath)
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return itemDates.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedItems[itemDates[section]]!.count
    }
    
    //MARK: - Set left swipe action for cells
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        let itemsForDate = groupedItems[itemDates[indexPath.section]]!
        let sortedItem = Array(itemsForDate)[indexPath.row]

        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            RealmManager.shared.realmDeleteValue( sortedItem)
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .redColor

        let editAction = UIContextualAction(style: .normal, title: "Edit") { (_, _, completionHandler) in

            let editCellInfo = AddingNewCellVC()
            let index = self.cellItem[indexPath.row]
            editCellInfo.textInputTitle.text = index.titleLabel
            editCellInfo.textInputAmount.text = String(index.value)
            editCellInfo.imageView.image = UIImage(named: "Beer")
            editCellInfo.textWithPicker.text = index.category
            editCellInfo.constants.dateView.date = index.date!
            editCellInfo.confirmBtn.setTitle("Edit", for: .normal)
            editCellInfo.confirmBtn.backgroundColor = .blueColor
            //editCellInfo.editStyle = true
            let navController = UINavigationController(rootViewController: editCellInfo)
            editCellInfo.navigationItem.title = "Editing cell"
            self.present(navController, animated: true, completion: nil)
            

        }
        editAction.image = UIImage(systemName: "square.and.pencil")
        editAction.backgroundColor = .blueColor

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        return configuration
    }
    
    func configureCell(_ cell: CustomCell, at indexPath: IndexPath) {
        
        //  sorting data by date
        let itemsForDate = groupedItems[itemDates[indexPath.section]]!
        let sortedItem = Array(itemsForDate)[indexPath.row]
        
        cell.titleLabel.text = sortedItem.titleLabel
        cell.dateLabel.text = dateFormatter(path: sortedItem.date!, format: "dd MMM HH:mm")
        cell.categoryLabel.text =  sortedItem.category
        cell.amountLabel.text = (sortedItem.type == 0 ? "+ " : "- ") + String(constans.separatedNumber(sortedItem.value)) + " ₽"
        cell.amountLabel.textColor = (sortedItem.type) == 0 ? .greenColor : .redColor
        guard let image = sortedItem.categoryImage else { return }
        cell.categoryImageView.image = UIImage(named: image)
        
    }
    
    //MARK:- buttons
    
    @objc private func butForCharts() {
        let chartBalance = ChartBalanceVC()
        navigationController?.pushViewController( chartBalance, animated: true)
    }
    
}
