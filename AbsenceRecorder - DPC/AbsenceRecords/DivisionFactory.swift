//
//  DivisionFactory.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 29/01/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

class DivisionFactory {
    
    static let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    static let fornames = ["Jayden", "Sofía", "Adam", "Ali", "Nathan", "Thomas", "Kate", "Alfie", "Christian"]
    static let surnames = ["Smith", "Lee", "Kumar", "Williams", "Specter", "Glover", "Ross", "Shelby", "Upton"]
    
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        for _ in (1...size) {
            
            let seconds: Int = Int.random(in: 50000000...60000000)
//            let forename = String((5..<10).map{ _ in alphabet.randomElement()! })
//            let surname = String((5..<10).map{ _ in alphabet.randomElement()! })

            let forename = fornames[Int.random(in: 0...8)]
            let surname = surnames[Int.random(in: 0...8)]
            
            division.students.append(Student(forename: forename , surname: surname, birthday: Date(timeIntervalSinceReferenceDate: TimeInterval(seconds))))
        }
        return division
    }
}
