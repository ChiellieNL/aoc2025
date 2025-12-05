//
//  Day5.swift
//  aoc2025
//
//  Created by Michiel Horvers on 05/12/2025.
//

import Foundation

final class Day5: AOCDay {

    private var freshRange: [ClosedRange<Int>]
    private var ingredients: [Int]

    init() {
        let lines = DataSource.lines(forDay: 5, useExampleInput: false)
        let split = lines.firstIndex(where: { !$0.contains("-") })!

        // Merge overlapping and adjacent ranges
        let sortedRanges = lines[0..<split]
            .map {
                Day5.range(for: $0)
            }
            .sorted {
                $0.lowerBound < $1.lowerBound
            }

        freshRange = []
        for range in sortedRanges {
            if let last = freshRange.last, last.upperBound >= range.lowerBound - 1 {
                // Overlapping or adjacent, merge
                freshRange[freshRange.count - 1] = last.lowerBound...max(last.upperBound, range.upperBound)
            } else {
                // New, append
                freshRange.append(range)
            }
        }

        ingredients = lines[split...].map { Int($0)! }
    }

    func part1() -> String {
        let freshCount = ingredients.filter { isFresh($0) }.count
        return "\(freshCount)"
    }

    func part2() -> String {
        // Sum the lengths of all (merged) ranges
        let total = freshRange.reduce(0) { $0 + ($1.upperBound - $1.lowerBound + 1) }
        return "\(total)"
    }
}

extension Day5 {
    private static func range(for input: String) -> ClosedRange<Int> {
        let parts = input.split(separator: "-").map { Int($0)! }
        return parts[0]...parts[1]
    }

    private func isFresh(_ ingredient: Int) -> Bool {
        for range in freshRange {
            if range.contains(ingredient) {
                return true
            }
        }
        return false
    }
}
