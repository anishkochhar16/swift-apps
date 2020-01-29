//
//  Tamagotchi.swift
//  TamagotchiFullApp
//
//  Created by Kochhar, Anish (EJNR) on 14/01/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import Foundation

class Tamagotchi {

    private var age: Int = 1
    private var weight: Int = 10
    private var hunger: Int = 4
    private var discipline: Int = 1
    private var happiness: Int = 1
    private var isSleeping: Bool = false
    private var name: String = "Default Name"
    private var health: Int = 100

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

    func getHappy() -> Int {
        return self.happiness
    }

    func getAge() -> Int {
        return self.age
    }

    func getDis () -> Int {
        return self.discipline
    }
    
    func getHealth () -> Int {
        return self.health
    }

    func feedMeal() {
        hunger = 1
        weight += 1
    }
    
    func feedSnack() {
        happiness += 1
        weight += 2
    }
    
    func Age() {
        age += 1
    }
    
    func removeDis() {
        discipline -= 1
    }
    
    func addDis() {
        discipline += 1
        happiness -= 2
    }
    
    func makeHappyOne() {
        if happiness < 4 {
            happiness += 1
            print("not max changing")

        } else {
            happiness = 5
            print("changing")

        }
    }
    
    func makeHappyTwo() {
        if happiness < 3 {
            happiness += 2
            print("n changing")

        } else {
            happiness = 5
            print("changing")
        }
    }
    
    func wakeUp() {
        if isSleeping == true {
            isSleeping = true
        }
    }

    func doPoop() {
        if happiness >= 3 {
            happiness = 5
        }
        if discipline >= 8 {
            discipline = 10
        }
        discipline += 2
        happiness += 2
    }

    func loseHealth() {
        health -= 5
        discipline -= 2
    }
    
    func playGame () {
        happiness += 3
        weight -= 1
    }

    func growUp () {
        print("Growing up")
        age += 1
    }

    func die() {
        print("\(name) died")
    }

    func Train() {
        print("Training your tamagotchi")
        discipline += 3
    }

    func showStats() -> String {
        return """
        Name: \(name)
        Age: \(age)
        Weight: \(weight)kg
        Hunger: \(hunger)/5
        Discipline: \(discipline)/10
        Happiness: \(happiness)/5
        Health: \(health)/100
        """
    }

    func giveMedicine() {
        print("Giving him medicine")
        health += 3
    }
}
