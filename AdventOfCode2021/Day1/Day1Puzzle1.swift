//
//  Day1Puzzle1.swift
//  AdventOfCode2021
//
//  Created by Guillaume Algis on 04/12/2021.
//

import Algorithms
import Foundation

typealias Depth = Int

enum DepthChange {
    case noChange
    case increasing
    case decreasing

    init(depth1: Int, depth2: Int) {
        if depth1 < depth2 {
            self = .increasing
        } else if depth2 < depth1 {
            self = .decreasing
        } else {
            self = .noChange
        }
    }
}

public func day1Puzzle1Main() {
    let input = loadInput(day: 1)
    let depths = depthsFromStrings(input)
    let increasingDepthsCount = countIncreasingDepthsChanges(from: depths)

    print(#function, "=>", increasingDepthsCount)
}

func depthsFromStrings(_ strings: [String]) -> [Depth] {
    strings.map { (strValue: String) -> Depth in
        guard let intValue = Depth(strValue) else {
            fatalError("\(strValue) is not convertible to Int")
        }
        return intValue
    }
}

func computedDepthsChanges(from depths: [Depth]) -> [DepthChange] {
    depths.adjacentPairs().map { DepthChange(depth1: $0, depth2: $1) }
}

func countIncreasingDepthsChanges(from depths: [Depth], windowSize: Int = 1) -> Int {
    precondition(windowSize >= 1, "windowSize cannot be smaller than 1")

    let groupedDepths = groupedDepth(depths, by: windowSize)
    let depthChanges = computedDepthsChanges(from: groupedDepths)
    let count = depthChanges.count { $0 == .increasing }
    return count
}
