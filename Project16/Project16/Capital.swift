//
//  Capital.swift
//  Project16
//
//  Created by Anish Kochhar on 29/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
