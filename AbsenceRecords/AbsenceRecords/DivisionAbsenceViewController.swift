//
//  DivisionAbsenceViewController.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 03/02/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class DivisionAbsenceViewController: UITableViewController {

    var division: Division?
    var absence: Absence?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = division?.code
        if let selectedRows = absence?.selectedRows {
            for selectedRow in selectedRows {
                tableView.selectRow(at: selectedRow, animated: false, scrollPosition: .none)
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = "\(division?.students[indexPath.row].forename ?? "Default") \(division?.students[indexPath.row].surname ?? "Default")"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division?.students.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedStudent = division?.students[indexPath.row] {
            absence?.present.append(selectedStudent)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let deselectedStudent = division?.students[indexPath.row] {
            absence?.present.removeAll {
                $0.forename == deselectedStudent.forename && $0.surname == deselectedStudent.surname && $0.birthday == deselectedStudent.birthday
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        absence?.selectedRows = tableView.indexPathsForSelectedRows
    }
    
}
