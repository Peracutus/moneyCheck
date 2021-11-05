//
//  RealmManager.swift
//  Money check
//
//  Created by Roman on 30.10.2021.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    let realm = try! Realm()
    
    func saveCellModel(model: CellItems) {
        try! realm.write{
            realm.add(model)
        }
    }
    
    func saveTaskModel(model: TaskModel) {
        try! realm.write{
            realm.add(model)
        }
    }
    
    func realmDeleteValue(_ value: CellItems){
        try! realm.write{
            realm.delete(value)
        }
    }
    
    func realmDeleteTask(_ value: TaskModel){
        try! realm.write{
            realm.delete(value)
        }
    }
    
    func updateReadyButton(task: TaskModel, bool: Bool) {
        try! realm.write {
            task.taskReady = bool
        }
    }
    //    func realmReadCellItems() -> Results<CellItems>? {
    //        let array = realm.objects(CellItems.self)
    //        return array
    //    }
    //    func realmDeleteValue(_ value: CellItems){
    //        try! realm.write{
    //            realm.delete(value)
    //        }
    //    }
    //    func realmReadCategory(_ category: String) -> LazyFilterSequence<Results<CellItems>>? {
    //        let array = realm.objects(CellItems.self).filter({$0.category == category})
    //        return array
    //    }
}

