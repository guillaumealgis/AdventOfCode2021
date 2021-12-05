//
//  Day1.swift
//  AdventOfCode2021Tests
//
//  Created by Guillaume Algis on 04/12/2021.
//

@testable import AdventOfCode2021
import XCTest

class Day1: XCTestCase {
    func testPuzzle1Example() throws {
        let depths = [
            199,
            200,
            208,
            210,
            200,
            207,
            240,
            269,
            260,
            263
        ]
        let increasingDepthsCount = countIncreasingDepthsChanges(from: depths)
        XCTAssertEqual(increasingDepthsCount, 7)
    }

    func testPuzzle2Example() throws {
        let depths = [
            199,
            200,
            208,
            210,
            200,
            207,
            240,
            269,
            260,
            263
        ]
        let increasingDepthsCount = countIncreasingDepthsChanges(from: depths, windowSize: 3)
        XCTAssertEqual(increasingDepthsCount, 5)
    }
}
