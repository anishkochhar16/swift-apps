//
//  ViewController.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 29/01/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDummyData()
        
        // iterate over every division
        // for each division, output its name and the number of students to the console
        // for each division, output each of its students names
        for division in divisions {
            print("Division Code: \(division.code)\nSize: \(division.students.count)\nStudents:")
            for student in division.students{
                print("Name: \(student.forename) \(student.surname)")
            }
        }
        updateDateDisplay()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DivisionAbsenceViewController") as? DivisionAbsenceViewController else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
        vc.division  = divisions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    fileprivate func updateDateDisplay() {
       let formatter = DateFormatter()
       formatter.dateStyle = .medium
       
       navigationItem.title = formatter.string(from: currentDate)
   }
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to:  currentDate) ?? Date()
        updateDateDisplay()
    }

    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to:  currentDate) ?? Date()
        updateDateDisplay()
    }
    
    func loadDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "vDW-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "vCX-2", of: 6))
        divisions.append(DivisionFactory.createDivision(code: "vBZ-1", of: 10))
    }

}

