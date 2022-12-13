//
//  StorageManager.swift
//  Schedule
//
//  Created by Grigory Don on 13.12.2022.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    let realm = try! Realm()
    
    func save(model: ScheduleModel) {
        try! realm.write {
            realm.add(model)
        }
    }
}
