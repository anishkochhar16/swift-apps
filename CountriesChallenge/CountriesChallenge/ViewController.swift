//
//  ViewController.swift
//  CountriesChallenge
//
//  Created by Anish Kochhar on 26/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getJSON() -> String {
        let url = "https://restcountries.eu/rest/v2/alpha/col"
        let urlRequest = URLRequest(url: url)
        
    }


}

