//
//  Command.swift
//  AdventOfCode2021
//
//  Created by Guillaume Algis on 05/12/2021.
//

import Foundation

enum Command: LosslessStringConvertible {
    case forward(Int)
    case down(Int)
    case up(Int)

    var description: String {
        switch self {
        case let .forward(offset):
            return "forward \(offset)"
        case let .down(depth):
            return "down \(depth)"
        case let .up(depth):
            return "up \(depth)"
        }
    }

    init?(_ description: String) {
        let scanner = Scanner(string: description)
        scanner.charactersToBeSkipped = nil

        let commandStr = scanner.scanCharacters(from: .letters)
        guard scanner.scanCharacter()?.isWhitespace == true else {
            return nil
        }
        let offsetStr = scanner.scanCharacters(from: .decimalDigits)
        guard let offsetStr = offsetStr, let offset = Int(offsetStr) else {
            return nil
        }
        switch commandStr {
        case "forward":
            self = .forward(offset)
        case "down":
            self = .down(offset)
        case "up":
            self = .up(offset)
        default:
            return nil
        }
    }
}
