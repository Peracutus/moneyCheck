//
//  UIColor.swift
//  Money check
//
//  Created by Roman on 26.09.2021.
//

import UIKit

extension UIColor {
    static func redColor()-> UIColor? {
        return UIColor.init(cgColor: #colorLiteral(red: 0.9154656529, green: 0.2698684335, blue: 0.3536528647, alpha: 1))
    }
    static func greenColor()-> UIColor? {
        return UIColor.init(cgColor: #colorLiteral(red: 0.3395635784, green: 0.6251170635, blue: 0.1700160801, alpha: 1))
    }
    static func blueColor()-> UIColor? {
        return UIColor.init(cgColor: #colorLiteral(red: 0.2915718257, green: 0.3437588513, blue: 0.9200721979, alpha: 1))
    }
    static func orangeColor()-> UIColor? {
        return UIColor.init(cgColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
    }
    static func bgColor()-> UIColor? {
        return UIColor(displayP3Red: 0.4, green: 1, blue: 1, alpha: 1)
    }
}

extension UIColor {
    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
    
}
