//
//  Day1.swift
//  aoc2025
//
//  Created by Michiel Horvers on 01/12/2025.
//

import Foundation

final class Day1: AOCDay {
    func part1() -> String {
        let lines = DataSource.lines(forDay: 1)

        var dial = 50
        var zeros = 0

        for line in lines {
            let direction = line[0]
            let distance = Int(line.substringFromIndex(1)!)!

            if direction == "L" {
                dial -= distance
                while dial < 0 {
                    dial += 100
                }
            } else if direction == "R" {
                dial += distance
                while dial > 99 {
                    dial -= 100
                }
            }

            if dial == 0 {
                zeros += 1
            }
        }

        return "\(zeros)"
    }

    func part2() -> String {
        let lines = DataSource.lines(forDay: 1)

        var dial = 50
        var zeros = 0

        for line in lines {
            let direction = line[0]
            let distance = Int(line.substringFromIndex(1)!)!

            if direction == "L" {
                for _ in 0..<distance {
                    dial -= 1
                    if dial == 0 {
                        zeros += 1
                    }
                    if dial < 0 {
                        dial += 100
                    }
                }

            } else if direction == "R" {
                for _ in 0..<distance {
                    dial += 1
                    if dial > 99 {
                        dial -= 100
                    }
                    if dial == 0 {
                        zeros += 1
                    }
                }
            }
        }

        return "\(zeros)"
    }
}
