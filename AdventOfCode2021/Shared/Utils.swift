//
//  Utils.swift
//  AdventOfCode2021
//
//  Created by Guillaume Algis on 04/12/2021.
//

import Foundation

/// Used to find the right bundle to load resources.
private final class Lighthouse {}

func loadInput(day: Int) -> [String] {
    let bundle = Bundle(for: Lighthouse.self)
    guard let inputPath = bundle.path(forResource: "Day\(day)Input", ofType: "txt") else {
        fatalError("Could not find input file for Day \(day) in bundle \(bundle)")
    }
    guard let contents = FileManager.default.contents(atPath: inputPath) else {
        fatalError("Could not read input for Day \(day): \(inputPath)")
    }
    guard let stringContents = String(data: contents, encoding: .utf8) else {
        fatalError("Could not decode input for Day \(day)")
    }

    let splitContent = stringContents.split(separator: "\n")
    return splitContent.map(String.init)
}
