//
//  ScheduleModel.swift
//  Schedule
//
//  Created by Grigory Don on 13.12.2022.
//

import RealmSwift
import Foundation

class ScheduleModel: Object {
    
    @Persisted var scheduleDate = Date()
    @Persisted var scheduleTime = Date()
    @Persisted var scheduleName: String = ""
    @Persisted var scheduleType: String = ""
    @Persisted var scheduleBuilding: String = ""
    @Persisted var scheduleAudience: String = ""
    @Persisted var scheduleTeacher: String = "default_name"
    @Persisted var scheduleColor: String = "1A4766"
    @Persisted var scheduleRepeaet: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}
