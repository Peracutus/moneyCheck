//
//  NewVC.swift
//  Money check
//
//  Created by Roman on 24.09.2021.
///trashcode
///
import UIKit
import RealmSwift

class NewVC: UIViewController {
    
//    private var calendar: FSCalendar = {
//        let calendar = FSCalendar()
//        calendar.translatesAutoresizingMaskIntoConstraints = true
//        return calendar
//    }()
    
    let showHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open calendar", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1976853899, green: 0.2366226746, blue: 0.3625023961, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = true
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let localRealm = try! Realm()
    var taskArray: Results<TaskModel>!
    let idTaskCell = "idTaskCell"
//    var calendarHeight: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        taskArray = localRealm.objects(TaskModel.self)
        
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = .week
        showHideButton.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TasksVCCell.self, forCellReuseIdentifier: idTaskCell)
        
        setConstraints()
        swipeActions()
        navigationUI()
//        taskOnDate(date: calendar.today!)
    }
    
    @objc private func showButtonTapped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Close Calendar", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Open Calendar", for: .normal)
        }
    }
    
    //MARK: SwipeGestureRecognizer
    private func swipeActions() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe ))
        swipeUp.direction = .up
        calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe ))
        swipeDown.direction = .down
        calendar.addGestureRecognizer(swipeDown)
    }
    
    @objc private func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .up:
            showButtonTapped()
        case .down:
            showButtonTapped()
        default:
            break
        }
    }
    
//    private func taskOnDate(date: Date) {
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.weekday], from: date)
//        guard let weekday = components.weekday else { return }
//        print(weekday)
//
//        let dateStart = date
//        let dateEnd: Date = {
//            let components = DateComponents(day: 1, second:  -1)
//            return Calendar.current.date(byAdding: components, to: dateStart)!
//        }()
//
//        let predicateRepeat = NSPredicate(format: "taskWeekday = \(weekday) AND taskDate BETWEEN %@", [dateStart, dateEnd])
//
//        taskArray = localRealm.objects(TaskModel.self).filter(predicateRepeat)
//        tableView.reloadData()
//    }
    
}

//MARK:- Delegate and DataSource
extension NewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTaskCell, for: indexPath) as! TasksVCCell
        cell.cellTaskDelegate = self
        cell.index = indexPath
        let model = taskArray[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editingRow = taskArray[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            RealmManager.shared.realmDeleteTask(editingRow)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension NewVC: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeight.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        taskOnDate(date: date)
    }
}

//MARK:- setConstraints

extension NewVC {
    
    func setConstraints() {
        
        calendarHeight = NSLayoutConstraint(item: calendar, attribute:  .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeight)
        view.addSubview(calendar)
        view.addSubview(tableView)
        calendar.easy.layout(Top(5).to(view.safeAreaLayoutGuide, .top), Left(0), Right(0))
        tableView.easy.layout(Top(20).to(calendar, .bottom), Left(), Right(), Bottom().to(view.safeAreaLayoutGuide, .bottom))
        view.addSubview(showHideButton)
        showHideButton.easy.layout(Top(0).to(calendar, .bottom), Width(100), Height(20), Left(15))
    }
    
    private func navigationUI() {
        navigationItem.title = "Additing item"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus")!, style: .plain, target: self, action: #selector(plusButton))
    }
    
    @objc private func plusButton() {
        let taskManagerAdditingView = TaskOptionsVC()
        navigationController?.pushViewController(taskManagerAdditingView, animated: true)
    }
}

extension  NewVC:PressReadyTaskButtonProtocol {
    func readyButtonTapped(indexPath: IndexPath) {
        let task = taskArray[indexPath.row]
        RealmManager.shared.updateReadyButton(task: task, bool: !task.taskReady)
        tableView.reloadData()
    }
}
