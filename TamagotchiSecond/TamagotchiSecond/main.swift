//
//  main.swift
//  TamagotchiSecond
//
//  Created by Kochhar, Anish (EJNR) on 21/11/2019.
//  Copyright © 2019 Kochhar, Anish (EJNR). All rights reserved.
//

import Foundation


print("What would you like to name your Tamagotchi? ")
var name = ""
if let input = readLine() {
    name = input
} else {
    name = "bob"
}
let tamagotchi = Tamagotchi(name: name)
print(tamagotchi.getName())

