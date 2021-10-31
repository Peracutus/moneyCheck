//
//  AlertDate.swift
//  Money check
//
//  Created by Roman on 06.10.2021.
//

import UIKit
import EasyPeasy

extension UIViewController {
    
    func alertDate(label: UILabel, complitionHandler: @escaping (Int,  Date) -> Void)  {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker(date: .date)
        datePicker.preferredDatePickerStyle  = .wheels
        datePicker.layer.borderWidth = 0
        
        alert.view.addSubview(datePicker)
        
        let ok = UIAlertAction(title: "OK", style: .default) {(action) in
            let dateString = self.dateFormatter(path: datePicker.date, format: "dd.MM.yyyy")
            
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
        alert.view.easy.layout(Height(300))
        datePicker.easy.layout(Width().like(alert.view, .width), Height(160), Top(20))
        
        present(alert, animated: true, completion: nil)
    }
}
