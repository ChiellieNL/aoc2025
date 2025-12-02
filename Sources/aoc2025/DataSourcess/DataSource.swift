//
//  DataSource.swift
//  aoc2025
//
//  Created by Michiel Horvers on 01/12/2025.
//

import Foundation

final class DataSource: Sendable {
    /**
     Load the input for the specified day

     - parameter day: The day number
     - parameter useExampleInput: Whether to use the example input file (default: `false`)
     - returns: The input as a string
     */
    static func input(forDay day: Int, useExampleInput: Bool = false) -> String {
        let fileUrl = URL(filePath: "Resources/day\(day)\(useExampleInput ? "_example" : "").txt")
        return try! String(contentsOf: fileUrl, encoding: .utf8)
    }

    /**
     Load the input for the specified day and split it into lines

     - parameter day: The day number
     - parameter useExampleInput: Whether to use the example input file (default: `false`)
     - returns: The input as an array of strings, one per line
     */
    static func lines(forDay day: Int, useExampleInput: Bool = false) -> [String] {
        let input = self.input(forDay: day, useExampleInput: useExampleInput)
        var lines = input.split(separator: "\n").map { String($0) }

        // depending on how we copy/pasted the input, there might be an extra empty line at the end
        if lines.last == "" {
            lines.removeLast()
        }

        return lines
    }

    /**
     Returns the AOCDay implementation for the specified day

     - parameter day: The day number
     - returns: The AOCDay implementation
     */
    static func code(forDay day: Int) -> AOCDay {
        switch day {
        case 1:
            Day1()

        case 2:
            Day2()
            
        default:
            fatalError("Day \(day) not yet implemented")
        }
    }
}
