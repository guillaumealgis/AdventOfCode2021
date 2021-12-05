//
//  Position.swift
//  AdventOfCode2021
//
//  Created by Guillaume Algis on 05/12/2021.
//

import Foundation

protocol Position: Equatable {
    static var zero: Self { get }

    var horizontal: Int { get }
    var depth: Int { get }

    var horizontalXDepth: Int { get }

    init()
    init(horizontal: Int, depth: Int)

    mutating func apply(_ command: Command)
}

extension Position {
    static var zero: Self {
        Self()
    }

    var horizontalXDepth: Int {
        horizontal * depth
    }
}
