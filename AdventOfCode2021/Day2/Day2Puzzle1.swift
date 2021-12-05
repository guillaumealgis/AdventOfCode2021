//
//  Day2Puzzle1.swift
//  AdventOfCode2021
//
//  Created by Guillaume Algis on 04/12/2021.
//

import Foundation

struct SimplePosition: Position {
    var horizontal: Int = 0
    var depth: Int = 0

    mutating func apply(_ command: Command) {
        switch command {
        case let .forward(units):
            horizontal += units
        case let .down(units):
            self.depth += units
        case let .up(units):
            self.depth -= units
        }
    }
}

public func day2Puzzle1Main() {
    let input = loadInput(day: 2)
    let position = updatedPosition(SimplePosition(), followingCommandsList: input)

    print(#function, "=>", position, "x", position.horizontalXDepth)
}

func updatedPosition<P: Position>(_ position: P, followingCommandsList commandsList: [String]) -> P {
    let commands = commandsList.map { (commandStr: String) -> Command in
        guard let command = Command(commandStr) else {
            fatalError("Could not parse command \"\(commandStr)\"")
        }
        return command
    }

    var newPosition = position
    commands.forEach { newPosition.apply($0) }

    return newPosition
}
