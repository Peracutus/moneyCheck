//
//   AlertSave.swift
//  Money check
//
//  Created by Roman on 30.10.2021.
//
///trashcode

import UIKit

extension UIViewController {
    
    func alertSave(title: String, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
