//
//  Meal.swift
//  FoodTracker
//
//  Created by Anish Kochhar on 28/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        if name.isEmpty {
            return nil
        }
        
        if (rating<0) || (rating>5) {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    // MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(photo, forKey: PropertyKey.photo)
        coder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else { return nil }
        let photo = coder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = coder.decodeInteger(forKey: PropertyKey.rating)
        
        self.init(name: name, photo: photo, rating: rating)
        
    }
}
