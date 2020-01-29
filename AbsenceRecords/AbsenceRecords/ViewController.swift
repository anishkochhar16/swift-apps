//
//  ViewController.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 29/01/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var divisions: [Division] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDummyData()
        
        // iterate over every division
        // for each division, output its name and the number of students to the console
        // for each division, output each of its students names
        for division in divisions {
            print("Division Code: \(division.code)\nSize: \(division.students.count)\nStudents:")
            for student in division.students{
                print("Name: \(student.forename) \(student.surname)")
            }
        }
            
       
        
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "C-F2", of: 6))
        divisions.append(DivisionFactory.createDivision(code: "A-D1", of: 10))
    }

}

