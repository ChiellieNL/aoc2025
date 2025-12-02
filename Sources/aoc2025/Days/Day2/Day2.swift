//
//  Day2.swift
//  aoc2025
//
//  Created by Michiel Horvers on 02/12/2025.
//

final class Day2: AOCDay {
    func part1() -> String {
        let input = DataSource.input(forDay: 2)
        var ranges = input.components(separatedBy: ",")
        if ranges.last == "" {
            ranges.removeLast()
        }

        var invalid = [Int]()

        for range in ranges {
            let bounds = range.trimmed().components(separatedBy: "-")
            let start = Int(bounds[0])!
            let end = Int(bounds[1])!
            for number in start...end {
                let numberString = String(number)
                if isRepeating1(numberString) {
                    invalid.append(number)
                }
            }
        }

        let sum = invalid.reduce(0, +)

        return "\(sum)"
    }

    func part2() -> String {
        let input = DataSource.input(forDay: 2)
        var ranges = input.components(separatedBy: ",")
        if ranges.last == "" {
            ranges.removeLast()
        }

        var invalid = [Int]()

        for range in ranges {
            let bounds = range.trimmed().components(separatedBy: "-")
            let start = Int(bounds[0])!
            let end = Int(bounds[1])!
            for number in start...end {
                let numberString = String(number)
                if isRepeating2(numberString) {
                    invalid.append(number)
                }
            }
        }

        let sum = invalid.reduce(0, +)

        return "\(sum)"
    }
}

extension Day2 {
    private func isRepeating1(_ value: String) -> Bool {
        // Check for even length and non-empty
        guard !value.isEmpty, value.count % 2 == 0 else { return false }
        // Check if all characters are digits
        guard value.allSatisfy({ $0.isNumber }) else { return false }
        let midIndex = value.index(value.startIndex, offsetBy: value.count / 2)
        let firstHalf = value[value.startIndex..<midIndex]
        let secondHalf = value[midIndex..<value.endIndex]
        return firstHalf == secondHalf
    }

    private func isRepeating2(_ value: String) -> Bool {
        guard !value.isEmpty, value.allSatisfy({ $0.isNumber }) else { return false }
        let length = value.count
        guard length >= 2 else { return false }
        for subLen in 1...(length / 2) {
            if length % subLen != 0 { continue }
            let repeatCount = length / subLen
            if repeatCount < 2 { continue }
            let sub = String(value.prefix(subLen)) // Convert Substring to String
            let repeated = String(repeating: sub, count: repeatCount)
            if repeated == value {
                return true
            }
        }
        return false
    }
}
