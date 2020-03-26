//
//  ViewController.swift
//  Project7
//
//  Created by Anish Kochhar on 16/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var filterdPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSelector(inBackground: #selector(fetchJson), with: nil)
    }
    
    @objc func fetchJson() {
        let urlString: String
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterData))
           
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parseJson(json: data)
                return
            }
        }
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        
    }
    
    @objc func filterData() {
        let ac = UIAlertController(title: "Filter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Submit filter", style: .default) { [weak self, weak ac] _ in
            if let answer = ac?.textFields?[0].text {
                let copyList = self?.petitions
                self?.filterdPetitions = [Petition]()
                for petition in copyList! {
                    if petition.title.contains(answer) {
                        self?.filterdPetitions.append(petition)
                    }
                }
            } else {
                self?.filterdPetitions = self!.petitions
            }
            self?.tableView.reloadData()
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
    
    @objc func showCredits () {
        let ac = UIAlertController(title: "This data comes from the We Are The People API of the Whitehouse", message: "https://api.whitehouse.gov/v1/petitions.json", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "dismiss", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc func showError() {
        let ac = UIAlertController(title: "loading error", message: "there was an error. check connection and try again", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "ok", style: .default))
        present(ac, animated: true)
    }
    
    func parseJson(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filterdPetitions = petitions
            
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let petition = filterdPetitions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


}

