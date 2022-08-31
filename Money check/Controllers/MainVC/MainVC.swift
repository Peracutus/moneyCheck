//
//  ViewController.swift
//  Money check
//
//  Created by Roman on 01.08.2021.
//

import UIKit
import RealmSwift

class MainVC: UITableViewController {
    
    var cellItem: Results<CellItems>!
    var constans = Constants()
    
    var groupedItems = [Date: Results<CellItems>]()
    var itemDates = [Date]()
    let realm = try! Realm()
    
    override func viewWillAppear(_ animated: Bool) {
        constans.calculatingValue()
        tableView.reloadData()
        dateForHeaders()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationUI()
        setupTableUI()
    }
    
    private func navigationUI() {
        navigationItem.title = "Personal finance"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus")!, style: .plain, target: self, action: #selector(plusPushButton))
    }

    private func setupTableUI() {
        view.backgroundColor = UIColor(named: "bgColor")
        tableView.bounces = false
        tableView.register(MainBudgetCell.self, forCellReuseIdentifier: "CheckListCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    @objc private func plusPushButton() {
        let secondVC = AddingNewCellVC()
        navigationController?.pushViewController(secondVC, animated: true)
        secondVC.navigationItem.title = "Add a new value"
    }
}
