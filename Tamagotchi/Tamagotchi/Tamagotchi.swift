//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Kochhar, Anish (EJNR) on 21/11/2019.
//  Copyright © 2019 Kochhar, Anish (EJNR). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    var age: Int
    var health: Int
    var weight: Int
    var hunger: Int
    var name: String
    var discipline: Int
    var isSleeping: Bool
    
    init() {
        age = 0
        health = 100
        weight = 10
        isSleeping = false
        discipline = 0
        hunger = 5
        name = "bob"
    }
    
    public func displayStats () {
        print("The age is: \(age) days")
        print("The health is: \(health)")
        print("The weight is: \(weight)kg")
        print("The discipline is: \(discipline)%")
        print("Their name is: \(name)")
    }
    
    public func feed() {
        hunger -= 1
        weight += 3
    }
    
    public func getHunger () -> Int {
        return self.hunger
    }
    
}
