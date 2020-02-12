//
//  CommentCard.swift
//  CommentCardWriter
//
//  Created by Kochhar, Anish (EJNR) on 11/02/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import Foundation

class CommentCard {
    var content: String = ""
    var division: Division
    
    init(division: Division) {
        self.division = division
    }
}
