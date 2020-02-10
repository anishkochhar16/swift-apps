//
//  ViewController.swift
//  AbsenceRecords
//
//  Created by Anish Kochhar on 29/01/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDummyData()
        updateDateDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        if divisions[indexPath.row].getAbsence(for: currentDate) != nil {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDivision = divisions[indexPath.row]
        var absence = Absence(date: currentDate)
        
        if let reusedAbsence = selectedDivision.getAbsence(for: currentDate) {
            absence = reusedAbsence
        } else {
            selectedDivision.absences.append(absence)
        }
        
         guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
             return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
         }) else {
             fatalError("Failed to load Division Absence View Controller from Storyboard")
         }


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
        tableView.reloadData()
    }

    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to:  currentDate) ?? Date()
        updateDateDisplay()
        tableView.reloadData()
    }
    
    func loadDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "vDW-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "vCX-2", of: 6))
        divisions.append(DivisionFactory.createDivision(code: "vBZ-1", of: 10))
        divisions.append(DivisionFactory.createDivision(code: "vCW-1", of: 7))
    }

}

