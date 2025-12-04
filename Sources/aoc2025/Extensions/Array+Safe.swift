//
//  Array+Safe.swift
//  aoc2025
//
//  Created by Michiel Horvers on 04/12/2025.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
