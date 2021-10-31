//
//  ViewController.swift
//  Money check
//
//  Created by Roman on 01.08.2021.
//

import UIKit
import EasyPeasy
import RealmSwift
import Lottie

struct UserCell {
    var image: String
    var title: String
    var category: String
    var value: String
    var date: Date
}

class MainVC: UITableViewController {
    
    var cellItem: Results<CellItems>!
    var constans = Constants()
    var groupedItems = [Date: Results<CellItems>]()
    var itemDates = [Date]()
    let realm = try! Realm()
    
    
    override func viewWillAppear(_ animated: Bool) {
        constans.calculatingValue()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationUI()
        setupTableUI()
        dateForHeaders()
        if RealmManager.shared.realm.objects(CellItems.self).isEmpty {
            view.addSubview(animateEmptyData())
        }
    }
    
    private func navigationUI() {
        
        navigationItem.title = "Personal finance"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3")!, style: .plain, target: self, action: #selector(settingsMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus")!, style: .plain, target: self, action: #selector(plusPushButton))
        
    }
    
    private func setupTableUI() {
        view.backgroundColor = UIColor(named: "bgColor")
        tableView.bounces = false
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CheckListCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    @objc private func settingsMenu() {
        let menu = MenuVC()
        navigationController?.pushViewController(menu, animated: true)
    }
    @objc private func plusPushButton() {
        let secondVC = AddingNewCellVC()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

