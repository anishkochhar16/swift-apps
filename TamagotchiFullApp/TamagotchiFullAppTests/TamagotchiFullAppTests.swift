//
//  TamagotchiFullAppTests.swift
//  TamagotchiFullAppTests
//
//  Created by Kochhar, Anish (EJNR) on 14/01/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import XCTest
@testable import TamagotchiFullApp

class TamagotchiFullAppTests: XCTestCase {

    
    let tamagotchi = Tamagotchi(name: "Default Name")
    
    func testTamagotchiSetsDefaultValues() {
        XCTAssertNotNil(tamagotchi)
    }
    
    func testFeedDecreasesHungerAndIncreasesWeight () {
        let originalHunger = tamagotchi.getHunger()
        let originalWeight = tamagotchi.getWeight()
        tamagotchi.feedMeal()
        let newHunger = tamagotchi.getHunger()
        let newWeight = tamagotchi.getWeight()
        XCTAssertNotEqual(originalHunger, newHunger)
        XCTAssertNotEqual(originalWeight, newWeight)
    }
    
    func testwakeUpChangesisSleepingToFalse () {
        tamagotchi.wakeUp()
        let stateOfConsciousness = tamagotchi.getState()
        XCTAssertEqual(stateOfConsciousness, false)
    }
    
    func testdoPoopDecreasesWeightAndIncreaseHappiness () {
        let originalWeight = tamagotchi.getWeight()
        let originalHappy = tamagotchi.getHappy()
        tamagotchi.doPoop()
        let newWeight = tamagotchi.getWeight()
        let newHappy = tamagotchi.getHappy()
        XCTAssertNotEqual(originalWeight, newWeight)
        XCTAssertNotEqual(originalHappy, newHappy)
    }
    
    func testGrowUpWorks () {
        let startAge = tamagotchi.getAge()
        tamagotchi.growUp()
        let finalAge = tamagotchi.getAge()
        XCTAssertNotEqual(startAge, finalAge)
    }
    
    func testTrainIncreasesDiscipline() {
        let startDis = tamagotchi.getDis()
        tamagotchi.Train()
        let finalDis = tamagotchi.getDis()
        XCTAssertNotEqual(startDis, finalDis)
    }

}
