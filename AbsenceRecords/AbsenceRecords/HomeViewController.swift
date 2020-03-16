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
        var absence = Absence(date: currentDate, present: selectedDivision.students)
        
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "All Present") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            if let absence = division.getAbsence(for: self.currentDate) {
                let index = division.absences.firstIndex(of: absence)
                division.absences.remove(at: index!)
            }
            let absence = Absence(date: self.currentDate, present: division.students)
            division.absences.append(absence)
            tableView.reloadData()
            completionHandler(true)
        }
        let clearAll = UIContextualAction(style: .destructive, title: "Clear All") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            if let absence = division.getAbsence(for: self.currentDate) {
                let index = division.absences.firstIndex(of: absence)
                division.absences.remove(at: index!)
            }
            tableView.reloadData()
            completionHandler(true)
        }
        allPresent.backgroundColor = UIColor.cyan
        return UISwipeActionsConfiguration(actions: [allPresent, clearAll])
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
    
    func convertDivisionsToJson() -> String? {
        let encoder = JSONEncoder()
        
        guard let encoded = try? encoder.encode(divisions) else {
            print("couldnt encode division")
            return nil
        }
        
        guard let json =  String(data: encoded, encoding: .utf8) else {
            print("Unable to turn encoded division into a string")
            return nil
        }
        
        return json
    }
    
    func decodeJsonToDivisions(json: Data) -> [Division]? {
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode([Division].self, from: json) else {
            print("couldnt decode")
            return nil
        }
        return decoded
    }
    
    func saveDataToFile() {
        guard let divisionJson = convertDivisionsToJson() else {
            return
        }
        
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            try divisionJson.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Unable to save by writing to file")
        }
    }
    
    func loadDataFromFile() {
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            let json = try Data(contentsOf: filePath)
            divisions = decodeJsonToDivisions(json: json) ?? []
        } catch {
            print("Failed to read from file")
            loadDummyData()
        }
    }
    
    func loadDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "vDW-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "vCX-2", of: 6))
        divisions.append(DivisionFactory.createDivision(code: "vBZ-1", of: 10))
        divisions.append(DivisionFactory.createDivision(code: "vCW-1", of: 7))
    }

}

