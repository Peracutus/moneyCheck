//
//  RealmForCell.swift
//  Money check
//
//  Created by Roman on 02.08.2021.
//

import RealmSwift

final class CellItems: Object {
    
    // MARK: - Entry Persisted Properties
    
    @objc dynamic var titleLabel: String?
    
    @objc dynamic var category: String?
    
    @objc dynamic var categoryImage: String?
    
    @objc dynamic var date: Date?
    
    @objc dynamic var value: Float = 0.0
    
    @objc dynamic var weekday: Int = 1
    
    @objc dynamic var type: Int32 = 0
    
    // MARK: - Custom Init to Add an CellItems
    
    convenience init(titleLabel: String,
                     category: String,
                     categoryImage: String,
                     date: Date,
                     value: Float,
                     type: Int32) {
        
        self.init()
        
        self.titleLabel = titleLabel
        
        self.category = category
        
        self.categoryImage = categoryImage
        
        self.date = date
        
        self.value = value
        
        self.type = type
        
    }
}
