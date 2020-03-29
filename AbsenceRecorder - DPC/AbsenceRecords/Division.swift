//
//  Division.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 29/01/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation


class Division: Codable {
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbsence(for date: Date) -> Absence? {
        return absences.first(where: {
            let comparision = Calendar.current.compare($0.takenOn, to: date, toGranularity: .day)
            return comparision == .orderedSame
        })
    }
    
}
