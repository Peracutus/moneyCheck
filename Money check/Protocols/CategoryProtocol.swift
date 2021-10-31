//
//  CategoryProtocol.swift
//  Money check
//
//  Created by Roman on 30.09.2021.
//

import Foundation
import UIKit

protocol Category: AnyObject {
    func selectedCategory(categoryName: String, categoryImage: UIImage)
}
