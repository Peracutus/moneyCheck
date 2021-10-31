//
//   AlertSave.swift
//  Money check
//
//  Created by Roman on 30.10.2021.
//

import UIKit

extension UIViewController {
    
    func alertSave(title: String) {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
