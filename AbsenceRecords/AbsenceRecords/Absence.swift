//
//  Absence.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 06/02/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

class Absence {
    var takenOn: Date
    var present: [Student] = []
    var selectedRows: [IndexPath]?
    
    init(date: Date) {
        takenOn = date
    }
}
