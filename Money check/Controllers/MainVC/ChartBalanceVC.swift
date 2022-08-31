//
//  ChartBalance.swift
//  Money check
//
//  Created by Roman on 18.09.2021.
//

import UIKit
import Charts
import RealmSwift

final class ChartBalanceVC: UIViewController {
    
    private var constans = Constants()
    private let incomeValue = UILabel(text: "Income", font: .avenirNext20(), alignment: .center)
    private let revenueValue = UILabel(text: "Expense", font: .avenirNext20(), alignment: .center)
    
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
        constans.calculatingValue()
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
        chartView.transparentCircleColor = .blueColor
        chartView.drawCenterTextEnabled = true
        chartView.centerText = "Balance"
        
        // Установка массива входных значений
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        // Set segments
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = [.greenColor, .redColor]
        
        // Set chart format
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "RUR"
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        
        // set path data
        chartView.data = pieChartData
        ///нет отображения значений по нужной дате, настроено только под общий баланс за все время
    }
}

//MARK:- setConstraints

extension ChartBalanceVC {
    private func setConstraints() {
        let dashboard = UIStackView(arrangedSubviews: [incomeValue, revenueValue], axis: .vertical, spacing: 10, distribution: .fillEqually)
        dashboard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dashboard)
        view.addSubview(chartView)
        dashboard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        dashboard.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dashboard.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dashboard.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        chartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        chartView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        chartView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        chartView.bottomAnchor.constraint(equalTo: dashboard.topAnchor, constant: -20).isActive = true
    }
}
