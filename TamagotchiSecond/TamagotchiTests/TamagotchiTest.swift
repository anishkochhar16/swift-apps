//
//  TamagotchiTest.swift
//  TamagotchiTests
//
//  Created by Kochhar, Anish (EJNR) on 21/11/2019.
//  Copyright © 2019 Kochhar, Anish (EJNR). All rights reserved.
//

import XCTest

class TamagotchiTest: XCTestCase {

    let tamagotchi = Tamagotchi(name: "Default Name")
    
    func testTamagotchiSetsDefaultValues() {
        XCTAssertNotNil(tamagotchi)
    }
    
    func testFeedDecreasesHungerAndIncreasesWeight () {
        let originalHunger = tamagotchi.getHunger()
        let originalWeight = tamagotchi.getWeight()
        tamagotchi.feed()
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
