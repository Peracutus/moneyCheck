//
//  TaskModel.swift
//  Money check
//
//  Created by Roman on 30.10.2021.
//

import RealmSwift

class TaskModel: Object {
    
    @Persisted var taskDate = Date()
    @Persisted var taskName: String = ""
    @Persisted var taskDescription: String = ""
    @Persisted var taskColor: String = "FFFFFF"
    @Persisted var taskWeekday: Int = 1
    
}
