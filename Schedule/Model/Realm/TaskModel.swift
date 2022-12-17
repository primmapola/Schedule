//
//  TaskModel.swift
//  Schedule
//
//  Created by Grigory Don on 17.12.2022.
//

import RealmSwift
import Foundation

class TaskModel: Object {
    
    @Persisted var taskDate = Date()
    @Persisted var taskName: String = ""
    @Persisted var taskContent: String = ""
    @Persisted var taskColor: String = "1A4766"
}
