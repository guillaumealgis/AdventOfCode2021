//
//  Day2.swift
//  AdventOfCode2021Tests
//
//  Created by Guillaume Algis on 04/12/2021.
//

@testable import AdventOfCode2021
import XCTest

class Day2: XCTestCase {
    func testPuzzle1Example() throws {
        let commandsList = [
            "forward 5",
            "down 5",
            "forward 8",
            "up 3",
            "down 8",
            "forward 2"
        ]
        let position = updatedPosition(SimplePosition(), followingCommandsList: commandsList)
        XCTAssertEqual(position.horizontal, 15)
        XCTAssertEqual(position.depth, 10)
    }

    func testPuzzle2Example() throws {
        let commandsList = [
            "forward 5",
            "down 5",
            "forward 8",
            "up 3",
            "down 8",
            "forward 2"
        ]
        let position = updatedPosition(AimedPosition(), followingCommandsList: commandsList)
        XCTAssertEqual(position.horizontal, 15)
        XCTAssertEqual(position.depth, 60)
        XCTAssertEqual(position.horizontalXDepth, 900)
    }
}
