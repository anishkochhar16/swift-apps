//
//  CountriesViewController.swift
//  CountriesChallenge
//
//  Created by Anish Kochhar on 26/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit


class CountriesViewController: UITableViewController {
    
    var country: Country?
    
    let statistics = ["Capital", "Area", "Population", "Region", "Gini Coefficient", "Flag"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = country?.name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Attribute", for: indexPath)
        cell.textLabel?.text = statistics[indexPath.row]
        switch indexPath.row {
        case 0:
            cell.detailTextLabel?.text = "\(country!.capital)"
        case 1:
            cell.detailTextLabel?.text = "\(country?.area ?? 300000000)"
        case 2:
            cell.detailTextLabel?.text = "\(country?.population ?? 10000000)"
        case 3:
            cell.detailTextLabel?.text = "\(country!.region)"
        case 4:
            cell.detailTextLabel?.text = "\(country?.gini ?? 0.5)"
        case 5:
            presentFlag(url: country?.flag ?? "https://restcountries.eu/data/col.svg")
        default:
            break
        }
        return cell
        
    }
    
    func presentFlag(url: String) {
        if let URL = URL(string: url) {
            if let image = try? Data(contentsOf: URL) as? UIImage {
                print("got image")
                
            } else {
                print("nah")
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

}
