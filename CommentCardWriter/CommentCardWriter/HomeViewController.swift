//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Kochhar, Anish (EJNR) on 11/02/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    var divisions: [Division] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDumyData()
        navigationItem.title = "Divisions"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        cell.textLabel?.text = divisions[indexPath.row].code
        cell.detailTextLabel?.text = divisions[indexPath.row].teacher
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDivision = divisions[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "SetupViewController", creator: { coder in
            return SetupViewController(coder: coder, division: selectedDivision)
        }) else {
            fatalError("Failed in load Setup View Controller from storyboard")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadDumyData() {
        divisions.append(Division(code: "vCW-1", teacher: "DPC"))
        divisions.append(Division(code: "mCV-1", teacher: "RSOJ"))
    }

}

