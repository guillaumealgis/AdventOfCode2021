//
//  Day1Puzzle2.swift
//  AdventOfCode2021
//
//  Created by Guillaume Algis on 05/12/2021.
//

import Foundation
public func day1Puzzle2Main() {
    let input = loadInput(day: 1)
    let depths = depthsFromStrings(input)
    let increasingDepthsCount = countIncreasingDepthsChanges(from: depths, windowSize: 3)

    print(#function, "=>", increasingDepthsCount)
}

func groupedDepth(_ depths: [Depth], by groupSize: Int) -> [Depth] {
    precondition(groupSize <= depths.count, "windowSize cannot be greater than the number of elements in depths")

    guard groupSize > 1 else {
        return depths
    }

    var groupedDepths: [Depth] = []

    var groupSum: Depth = 0
    var groupStartIndex = depths.startIndex
    var currentIndex = depths.startIndex
    while groupStartIndex <= depths.index(depths.endIndex, offsetBy: -groupSize) {
        let depth = depths[currentIndex]
        groupSum += depth

        currentIndex = currentIndex.advanced(by: 1)
        if currentIndex == groupStartIndex + groupSize {
            groupedDepths.append(groupSum)

            groupSum = 0
            groupStartIndex = groupStartIndex.advanced(by: 1)
            currentIndex = groupStartIndex
        }
    }
    return groupedDepths
}
