//
//  AlertForCellName.swift
//  Money check
//
//  Created by Roman on 06.10.2021.
//
///trashcode

import UIKit

extension UIViewController {
    
    func alertForCellName(label: UILabel, name: String, placeholder: String, complitionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            let tfAlert = alert.textFields?.first
            guard let text = tfAlert?.text else {return}
            label.text = (text != "" ? text : label.text)
            complitionHandler(text)
        }
        alert.addTextField {(tfAlert) in
            tfAlert.placeholder = placeholder
        }
        let cancel = UIAlertAction(title: "Cansel", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
