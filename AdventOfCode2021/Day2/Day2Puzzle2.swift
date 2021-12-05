//
//  Day2Puzzle2.swift
//  AdventOfCode2021
//
//  Created by Guillaume Algis on 05/12/2021.
//

import Foundation

struct AimedPosition: Position {
    var horizontal: Int = 0
    var depth: Int = 0
    var aim: Int = 0

    init() {
        self = .init(horizontal: 0, depth: 0, aim: 0)
    }

    init(horizontal: Int, depth: Int) {
        self = .init(horizontal: horizontal, depth: depth, aim: 0)
    }

    internal init(horizontal: Int = 0, depth: Int = 0, aim: Int = 0) {
        self.horizontal = horizontal
        self.depth = depth
        self.aim = aim
    }

    mutating func apply(_ command: Command) {
        switch command {
        case let .forward(units):
            horizontal += units
            depth += aim * units
        case let .down(units):
            aim += units
        case let .up(units):
            aim -= units
        }
    }
}

public func day2Puzzle2Main() {
    let input = loadInput(day: 2)
    let position = updatedPosition(AimedPosition(), followingCommandsList: input)

    print(#function, "=>", position, "x", position.horizontalXDepth)
}
