//
//  AlertDate.swift
//  Money check
//
//  Created by Roman on 06.10.2021.
//
///trashcode

import UIKit

extension UIViewController {
    
    func alertDate(label: UILabel, complitionHandler: @escaping (Int,  Date) -> Void)  {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker(date: .date)
        datePicker.preferredDatePickerStyle  = .wheels
        datePicker.layer.borderWidth = 0
        let constants = Constants()
        alert.view.addSubview(datePicker)
        
        let ok = UIAlertAction(title: "OK", style: .default) {(action) in
            let dateString = constants.dateFormatter(path: datePicker.date, format: "dd.MM.yyyy")
            
            let calendar = Calendar.current
            let component = calendar.dateComponents([.weekday], from: datePicker.date)
            guard let weekday = component.weekday else {return}
            let date = datePicker.date 
            complitionHandler(weekday, date)
            
            label.text = dateString
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        labelDescription.heightAnchor.constraint(equalToConstant: 160).isActive = true
//        labelDescription.widthAnchor.constraint(equalToConstant: alert.view.widthAnchor).isActive = true
//        labelDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
}
