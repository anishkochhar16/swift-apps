//
//  ViewController.swift
//  CountriesChallenge
//
//  Created by Anish Kochhar on 26/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countriesData = [Country]()
    
    let countryCodes = ["col", "arg", "aus", "bel", "chn", "dnk", "gab", "ind", "hk", "jpn", "prt", "lca", "sgp", "za", "gbr", "zwe"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        
        for countryCode in countryCodes {
            getJSON(code: countryCode)
        }
    }
    
    func getJSON(code: String) {
        if let url = URL(string: "https://restcountries.eu/rest/v2/alpha/\(code)") {
            if let data = try? Data(contentsOf: url) {
                parseJson(json: data)
                return
            }
        }
    }
    
    func parseJson(json: Data) {
        let decoder = JSONDecoder()
        if let country = try? decoder.decode(Country.self, from: json) {
            countriesData.append(country)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countriesData[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "CountriesView") as? CountriesViewController else { return }
//        let vc = CountriesViewController()
        vc.country = countriesData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

