//
//  Grid.swift
//  aoc2025
//
//  Created by Michiel Horvers on 04/12/2025.
//

import Foundation

/**
 # Grid

 A grid of characters
 */
struct Grid {
    /// Neighbouring positions in the grid
    enum Neighbour {
        case upLeft
        case up
        case upRight
        case left
        case right
        case downLeft
        case down
        case downRight

        /**
         Get the point of this neighbour relative to the given origin point

         - parameter origin: The origin point
         - returns: The point of this neighbour
         */
        func point(for origin: CGPoint) -> CGPoint {
            switch self {
            case .upLeft:
                CGPoint(x: origin.x - 1, y: origin.y - 1)
            case .up:
                CGPoint(x: origin.x, y: origin.y - 1)
            case .upRight:
                CGPoint(x: origin.x + 1, y: origin.y - 1)
            case .left:
                CGPoint(x: origin.x - 1, y: origin.y)
            case .right:
                CGPoint(x: origin.x + 1, y: origin.y)
            case .downLeft:
                CGPoint(x: origin.x - 1, y: origin.y + 1)
            case .down:
                CGPoint(x: origin.x, y: origin.y + 1)
            case .downRight:
                CGPoint(x: origin.x + 1, y: origin.y + 1)
            }
        }
    }

    /// Cells in the grid
    var cells: [[Character]]

    /**
     Initialize the grid with the given lines

     > Important:
     For this grid we assume that all lines have the same length.

     - parameter lines: The lines to initialize the grid with
     */
    init(_ lines: [String]) {
        cells = []
        for line in lines {
            var row: [Character] = []
            for char in line {
                row.append(char)
            }
            cells.append(row)
        }
    }

    /// Width/Columns of the grid
    var width: Int {
        guard let firstRow = cells.first else { return 0 }
        return firstRow.count
    }

    /// Height/Rows of the grid
    var height: Int {
        return cells.count
    }

    /// Total number of cells in the grid
    var total: Int {
        return width * height
    }

    subscript(x: Int, y: Int) -> Character {
        get {
            return cells[y][x]
        }
        set {
            cells[y][x] = newValue
        }
    }

    subscript(_ point: CGPoint) -> Character {
        get {
            return self[Int(point.x), Int(point.y)]
        }
        set {
            self[Int(point.x), Int(point.y)] = newValue
        }
    }

    func neighbours(_ neighbours: Set<Neighbour>, of point: CGPoint) -> [Character] {
        var result: [Character] = []
        for neighbour in neighbours {
            let neighbourPoint = neighbour.point(for: point)
            guard let value = cells[safe: Int(neighbourPoint.y)]?[safe: Int(neighbourPoint.x)] else {
                continue
            }
            result.append(value)
        }

        return result
    }

    func neighbours(_ neighbourSet: Set<Neighbour>, ofX x: Int, y: Int) -> [Character] {
        neighbours(neighbourSet, of: CGPoint(x: CGFloat(x), y: CGFloat(y)))
    }
}

extension Set where Element == Grid.Neighbour {
    static let all: Set<Grid.Neighbour> = [.upLeft, .up, .upRight, .left, .right, .downLeft, .down, .downRight]
    static let vertical: Set<Grid.Neighbour> = [.up, .down]
    static let horizontal: Set<Grid.Neighbour> = [.left, .right]
    static let diagonal: Set<Grid.Neighbour> = [.upLeft, .upRight, .downLeft, .downRight]
}
