//
//  Constans.swift
//  Money check
//
//  Created by Roman on 01.08.2021.
//

import Foundation
import UIKit

struct Constants {
    
    //MARK:- Main View
    var income: Float = 0
    var expense: Float = 0
    var balance: Float = 0
    
    func setupNavButon(image: UIImage, selector: Selector)->UIBarButtonItem {
        let navBarItem = UIBarButtonItem(image: image, style: .plain, target: self, action: selector)
        return navBarItem
    }
    
    func viewWithbutton(color: UIColor, name: String, selector: Selector) -> UIView {
        let view = UIView()
        let button = UIButton(color: color, name: name)
        button.addTarget(self, action: selector, for: .touchUpInside)
        view.addSubview(button)
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        return view
    }
    
    mutating func calculatingValue() {
        let items = RealmManager.shared.realm.objects(CellItems.self)
        income = 0
        expense = 0
        for item in items {
            if item.type == 0 {
                income += item.value
            } else {
                expense += item.value
            }
            balance = income - expense
        }
    }
    
    func separatedNumber(_ number: Any) -> String {
        guard let itIsANumber = number as? NSNumber else { return "Not a number" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        return formatter.string(from: itIsANumber)!
    }
    
    //MARK:- Adding new items view
    
    func label(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = text
        return label
    }
    
    let dateView = UIDatePicker(date: .dateAndTime)
    let typePick: UISegmentedControl = {
        let items = ["Income", "Expense"]
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        sc.layer.cornerRadius = 16
        sc.backgroundColor = .black
        sc.selectedSegmentTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        sc.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        ], for: .normal)
        sc.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sc.widthAnchor.constraint(equalToConstant: 220).isActive = true
        return sc
    }()
    
    func dateFormatter(path: Date, format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .full
        dateFormatter.dateFormat = format
        let pickerDateString = dateFormatter.string(from: path)
        let dateString = " \(pickerDateString)"
        
        // make sure the following are the same as that used in the API
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale.current
        
        return dateString
    }
}

