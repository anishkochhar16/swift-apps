//
//  main.swift
//  TamagotchiSecond
//
//  Created by Kochhar, Anish (EJNR) on 21/11/2019.
//  Copyright © 2019 Kochhar, Anish (EJNR). All rights reserved.
//

import Foundation

func makeTamatochi () -> Tamagotchi {
    print("What would you like to name your Tamagotchi? ")
    var name = ""
    if let input = readLine() {
        name = input
    }
    if (name.count == 0) {
        print("Using a default name")
        name = "Bob"
    }
    let tamagotchi = Tamagotchi(name: name)
    print("Your tamagotchi's name is: " + tamagotchi.getName())
    return tamagotchi

}

func printMenu (tamagotchi: Tamagotchi) {
    print("What would you like to do with your tamagotchi:\n1) Display Stats\n2) Feed\n3) Play Game\n4) Train them\n5) Give Medicine\n6) Random Event Only")
    if let input = readLine() {
        if let number = Int(input) {
            let randomEvent = Int.random(in: 1...100)
            if number == 1 {
                tamagotchi.showStats()
            } else if number == 2 {
                print("Feeding Tamagotchi\n")
                tamagotchi.feed()
            } else if number == 3 {
                tamagotchi.playGame()
            } else if number == 4 {
                print("Training your tamagotchi\n")
                tamagotchi.Train()
            } else if number == 5 {
                tamagotchi.giveMedicine()
            } else if number == 6 {
                print("Only doing the random event\n")
            }
            else {
                print("Invalid Input")
            }
            
            tamagotchi.randomEvent(randomEvent: randomEvent)
        }
        else {
            print("Invalid Input")
        }
    }
    else {
        print("Invalid Input")
    }
}

let tamagotchi = makeTamatochi()
var stop = false
while stop == false {
    print("Press 3 when you would like to stop, if not, press any other key\n")
    if let input = readLine() {
        if input == "3" {
            stop = true
        }
    }
    printMenu(tamagotchi: tamagotchi)

}
