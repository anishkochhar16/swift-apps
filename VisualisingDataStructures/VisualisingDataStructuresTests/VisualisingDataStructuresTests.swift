//
//  VisualisingDataStructuresTests.swift
//  VisualisingDataStructuresTests
//
//  Created by Kochhar, Anish (EJNR) on 27/01/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import XCTest
@testable import VisualisingDataStructures

class VisualisingDataStructuresTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testStackClassReturnsNilIfPopWhenEmpty () {
        var stack = Stack()
        
        let item = stack.pop()
        
        XCTAssertEqual(nil, item)
    }
    
    func testStackAddsToArrayWhenPushed () {
        var stack = Stack()
        
        XCTAssertEqual(stack.array, [])
        
        stack.push(item: 10)
        stack.push(item: 10)

        stack.push(item: 10)

        
        XCTAssertEqual(stack.array, [10])
    }
    
}
