//
//  DivisionTests.swift
//  AbsenceRecordsTests
//
//  Created by Anish Kochhar on 09/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import XCTest

class DivisionTests: XCTestCase {

    func testGetAbsenceWithCurrentDateRetrivesExistingAbsenceOnSameDay() {
        // arrange
        let division = Division(code: "testDiv")
        let absence = Absence(date: Date())
        division.absences.append(absence)
        // act
        let laterDateToday = Date(timeIntervalSinceNow: 100)
        let actual = division.getAbsence(for: laterDateToday)
        // assert
        XCTAssertNotNil(actual)
    }

}
