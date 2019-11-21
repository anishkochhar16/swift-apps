//
//  Tamagotchi.swift
//  TamagotchiSecond
//
//  Created by Kochhar, Anish (EJNR) on 21/11/2019.
//  Copyright © 2019 Kochhar, Anish (EJNR). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    private var age: Int = 0
    private var weight: Int = 10
    private var hunger: Int = 4
    private var discipline: Int = 0
    private var happiness: Int = 0
    private var isSleeping: Bool = false
    private var name: String = "Default Name"
    
    init (name: String) {
        self.name = name
    }
    
    func getHunger () -> Int {
        return self.hunger
    }
    
    func getWeight () -> Int {
        return self.weight
    }
    
    func getState() -> Bool {
        return self.isSleeping
    }
    
    func getName() -> String {
        return self.name
    }
    
    func feed() {
        hunger -= 1
        weight += 3
        print("The new hunger is \(hunger)")
        print("The new weight is \(weight)")
    }
    
    func wakeUp() {
        if isSleeping == true {
            isSleeping = true
        }
    }
    
    func doPoop() {
        weight -= 2
    }
}
