//
//  Day3.swift
//  aoc2025
//
//  Created by Michiel Horvers on 03/12/2025.
//

import Foundation

final class Day3: AOCDay {
    func part1() -> String {
        let lines = DataSource.lines(forDay: 3)
        var joltage = [Int]()

        for line in lines {
            var max = 0
            for first in 0..<(line.count - 1) {
                for second in (first + 1)..<line.count {
                    let firstChar = line[first]!
                    let secondChar = line[second]!
                    let value = Int(String(firstChar))! * 10 + Int(String(secondChar))!
                    if value > max {
                        max = value
                    }
                }
            }

            joltage.append(max)
        }

        let total = joltage.reduce(0, +)
        return "\(total)"
    }

    func part2() -> String {
        let lines = DataSource.lines(forDay: 3)
        var joltage = [Int]()

        for line in lines {
            let size = line.count
            if size < 12 {
                joltage.append(0)
                continue
            }
            var result = ""
            var start = line.startIndex
            var remaining = size
            var digitsToPick = 12
            while digitsToPick > 0 {
                // The farthest we can look ahead to ensure enough characters remain
                let maxLookahead = remaining - digitsToPick
                var maxDigit: Character = "0"
                var maxIndex = start
                var idx = start
                for _ in 0...maxLookahead {
                    let digit = line[idx]
                    if digit > maxDigit {
                        maxDigit = digit
                        maxIndex = idx
                    }
                    if digit == "9" { break } // can't get better
                    idx = line.index(after: idx)
                }
                result.append(maxDigit)
                // Move start to after the chosen digit
                start = line.index(after: maxIndex)
                remaining = size - line.distance(from: line.startIndex, to: start)
                digitsToPick -= 1
            }
            joltage.append(Int(result) ?? 0)
        }

        let total = joltage.reduce(0, +)
        return "\(total)"
    }
}
