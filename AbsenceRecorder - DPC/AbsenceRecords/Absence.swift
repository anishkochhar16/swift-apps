//
//  Absence.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 06/02/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

class Absence: Equatable, Codable {

    var takenOn: Date
    var present: [Student] = []
    
    init(date: Date) {
        takenOn = date
    }
    
    init(date: Date, present: [Student]) {
        takenOn = date
        self.present = present
    }
    
    static func == (lhs: Absence, rhs: Absence) -> Bool {
        return lhs.takenOn == rhs.takenOn
    }
    
}
