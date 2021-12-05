//
//  Collection+Utils.swift
//  AdventOfCode2021
//
//  Created by Guillaume Algis on 04/12/2021.
//

import Foundation

extension Collection {
    func count(where test: (Element) throws -> Bool) rethrows -> Int {
        try filter(test).count
    }
}
