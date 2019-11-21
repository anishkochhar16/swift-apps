//
//  TamagotchiTest.swift
//  TamagotchiTests
//
//  Created by Kochhar, Anish (EJNR) on 21/11/2019.
//  Copyright © 2019 Kochhar, Anish (EJNR). All rights reserved.
//

import XCTest

class TamagotchiTest: XCTestCase {

    let tamagotchi = Tamagotchi()
    
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
        tamagotchi.doPoop()
        let newWeight = tamagotchi.getWeight()
        XCTAssertNotEqual(originalWeight, newWeight)
    }

}
