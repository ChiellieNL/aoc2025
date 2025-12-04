//
//  Day4.swift
//  aoc2025
//
//  Created by Michiel Horvers on 04/12/2025.
//

import Foundation

final class Day4: AOCDay {
    func part1() -> String {
        var grid = DataSource.grid(forDay: 4)
        let result = removable(in: &grid, clearWhenRemoved: false)

        return "\(result)"
    }

    func part2() -> String {
        var grid = DataSource.grid(forDay: 4)
        var totalRemoved = 0
        var result = 1

        while result > 0 {
            result = removable(in: &grid, clearWhenRemoved: true)
            totalRemoved += result
        }

        return "\(totalRemoved)"
    }

    private func removable(in grid: inout Grid, clearWhenRemoved: Bool) -> Int {
        var result = 0
        var canBeRemoved = [CGPoint]()

        for y in 0..<grid.height {
            for x in 0..<grid.width {
                let point = CGPoint(x: CGFloat(x), y: CGFloat(y))

                if grid[point] == "@" {
                    let papers = grid
                        .neighbours(.all, ofX: x, y: y)
                        .filter { $0 == "@" }
                        .count

                    if papers < 4 {
                        result += 1
                        canBeRemoved.append(point)
                    }
                }
            }
        }

        if clearWhenRemoved {
            for point in canBeRemoved {
                grid[point] = "."
            }
        }

        return result
    }
}
