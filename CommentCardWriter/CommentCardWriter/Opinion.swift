//
//  Opinion.swift
//  CommentCardWriter
//
//  Created by Kochhar, Anish (EJNR) on 11/02/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import Foundation

class Opinion {
    var strengths: [String]
    var weaknesses: [String]
    var effort: Int
    var enjoyment: Int
    var division: Division
    
    init(strengths: [String], weaknesses: [String], effort: Int, enjoyment: Int, division: Division) {
        self.strengths = strengths
        self.weaknesses = weaknesses
        self.effort = effort
        self.enjoyment = enjoyment
        self.division = division
    }
}
