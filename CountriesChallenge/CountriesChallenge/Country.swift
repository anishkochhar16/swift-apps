//
//  Country.swift
//  CountriesChallenge
//
//  Created by Anish Kochhar on 26/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let region: String
    let capital: String
    let gini: Float
    let flag: String
    let area: Int
    let population: Int
}
