//
//  RealmForCell.swift
//  Money check
//
//  Created by Roman on 02.08.2021.
//

import RealmSwift

class CellItems: Object {
    
    @objc dynamic var titleLabel: String?
    @objc dynamic var category: String?
    @objc dynamic var categoryImage: String?
    @objc dynamic var date: Date?
    @objc dynamic var value: Float = 0.0
    @objc dynamic var type: Int32 = 0
    
}
