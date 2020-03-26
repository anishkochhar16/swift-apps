//
//  Person.swift
//  Project10
//
//  Created by Anish Kochhar on 17/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
