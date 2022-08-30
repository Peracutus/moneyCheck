//
//  TextFieldDelegate.swift
//  Money check
//
//  Created by Roman on 02.08.2021.
//

import UIKit

//MARK: - Up and down view with using Keyboard

extension AddingNewCellVC {
    
     func registerKeyboardNotification() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc  func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height/2)
    }
    
    @objc  func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }
    
     func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - UITextFieldDelegate

extension AddingNewCellVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textInputTitle.resignFirstResponder()
        textInputAmount.resignFirstResponder()
        textWithPicker.resignFirstResponder()
        return true
    }
    
}

