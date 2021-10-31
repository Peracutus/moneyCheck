//
//  ChartBalance.swift
//  Money check
//
//  Created by Roman on 18.09.2021.
//

import UIKit
import Charts
import EasyPeasy
import FSCalendar

class ChartBalanceVC: UIViewController {
    
    private var constans = Constants()
    private var calendarHeight: NSLayoutConstraint!
    private let incomeValue = UILabel(text: "Income", font: .avenirNext20(), alignment: .center)
    private let revenueValue = UILabel(text: "Expense", font: .avenirNext20(), alignment: .center)
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = true
        return calendar
    }()
    
    private let chartView: PieChartView = {
        let view = PieChartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        setChart(dataPoints: ["Income","Expense"], values: [constans.income,constans.expense].map{ Double($0) })
        incomeValue.text = "Income = \(constans.income)"
        revenueValue.text = "Expense = \(constans.separatedNumber(percentValue())) %"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Balance analysis"
        setConstraints()
        swipeActions()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = .week
        constans.calculatingValue()
    }
    
    @objc private func showButtonSwiped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
        } else {
            calendar.setScope(.week, animated: true)
        }
    }
    
    //MARK: - SwipeGestureRecognizer
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
            showButtonSwiped()
        case .down:
            showButtonSwiped()
        default:
            break
        }
    }
    
    private func percentValue() -> Float {
        let percentExpense = (constans.expense/constans.income)*100
        return percentExpense
    }
    
    private func setChart(dataPoints: [String], values: [Double]) {
        // chart settings
        chartView.drawHoleEnabled = true
        chartView.holeRadiusPercent = 0.2
        chartView.transparentCircleRadiusPercent = 0.382
        chartView.transparentCircleColor = .blueColor()
        chartView.drawCenterTextEnabled = true
        chartView.centerText = "Balane"
        
        // Установка массива входных значений
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        // Set segments
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = [.greenColor()!, .redColor()!]
        
        // Set chart format
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .currency
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        
        // set path data
        chartView.data = pieChartData
    }
}
//MARK:- Delegate and DataSource

extension ChartBalanceVC: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeight.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: date)
        guard let weekday = components.weekday else {return}
        print(weekday)
    }
}

//MARK:- setConstraints

extension ChartBalanceVC {
    private func setConstraints() {
        let dashboard = UIStackView(arrangedSubviews: [incomeValue, revenueValue], axis: .vertical, spacing: 10, distribution: .fillEqually)
        
        view.addSubview(calendar)
        view.addSubview(dashboard)
        view.addSubview(chartView)
        
        calendarHeight = NSLayoutConstraint(item: calendar, attribute:  .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeight)
        
        calendar.easy.layout(Top(5).to(view.safeAreaLayoutGuide, .top), Left(0), Right(0))
        dashboard.easy.layout(Bottom(20).to(view.safeAreaLayoutGuide, .bottom), Left(), Right(), Height(100))
        
        chartView.easy.layout(Top(20).to(calendar, .bottom), Left(), Right(), Bottom(20).to(dashboard))
    }
}
