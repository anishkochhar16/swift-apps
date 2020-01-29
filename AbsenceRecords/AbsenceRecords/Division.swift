//
//  Division.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 29/01/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation


class Division {
    let code: String
    var students: [Student] = []
    
    init(code: String) {
        self.code = code
        let seconds = Int.random(in: 1...3)
    }
}
