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
        print("Doing a poo")
        weight -= 2
        happiness += 2
    }
    
    func playGame () {
        print("Playing a game")
        happiness += 3
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
    
    func showStats() {
        print("Name: \(name)")
        print("Age: \(age)")
        print("Weight: \(weight) ")
        print("Hunger: \(hunger)")
        print("Discipline: \(discipline)")
        print("Happiness: \(happiness)")
        print("Health: \(health)")
    }
    
    func giveMedicine() {
        print("Giving him medicine")
        health += 3
    }
    
    func randomEvent(randomEvent: Int) {
        if randomEvent <= 5 {
            print("Your random event was dying")
            die()
        } else if randomEvent <= 25 {
            print("Your random event was pooping")
            doPoop()
        } else if randomEvent <= 50 {
            print("Your random event was aging")
            growUp()
        } else if randomEvent <= 70 {
            print("Your random event was playing a game")
            playGame()
        } else if randomEvent <= 85 {
            print("Your random event was healing")
            giveMedicine()
        } else {
            print("Your random event was training")
            Train()
        }
    }
}
