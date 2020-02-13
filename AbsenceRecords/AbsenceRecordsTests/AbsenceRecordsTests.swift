//
//  AbsenceRecordsTests.swift
//  AbsenceRecordsTests
//
//  Created by Anish Kochhar on 29/01/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import XCTest
@testable import AbsenceRecords

class AbsenceRecordsTests: XCTestCase {

    func testDivisionFactoryReturnsADivisionWithCorrectCodeAndNumberOfStudents() {
        let division = DivisionFactory.createDivision(code: "vDW-1", of: 8)
        
        XCTAssertEqual(division.students.count, 8)
        XCTAssertEqual(division.code, "vDW-1")
    }

}
