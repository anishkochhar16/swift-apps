//
//  Petition.swift
//  Project7
//
//  Created by Anish Kochhar on 16/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
