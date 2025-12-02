//
//  String+Trim.swift
//  aoc2025
//
//  Created by Michiel Horvers on 02/12/2025.
//

import Foundation

extension String {
    /**
     Trims this String from white spaces and new lines
     
     - returns: The trimmed String
     */
    public func trimmed() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
