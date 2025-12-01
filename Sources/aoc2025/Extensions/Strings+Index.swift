//
//  Strings+Index.swift
//  aoc2025
//
//  Created by Michiel Horvers on 01/12/2025.
//

import Foundation

/**
 # String + Index

 'Old fashion' string indexes and substrings
 */
extension String {
    /**
     Returns a substring from the start of the string to the specified index

     - parameter index: The upper-bound index
     - returns: The substring or nil in case the index is out of bounds
     */
    public func substringToIndex(_ index: Int) -> String? {
        guard index >= 0 && index <= self.count else { return nil }

        return String(self[...self.index(self.startIndex, offsetBy: index-1)])
    }

    /**
     Returns a substring from the specified index to the end of the string

     - parameter index: The lower-bound index
     - returns: The substring or nil in case the index is out of bounds
     */
    public func substringFromIndex(_ index: Int) -> String? {
        guard index >= 0 && index <= self.count else { return nil }

        return String(self[self.index(self.startIndex, offsetBy: index)...])
    }

    /**
     Returns a substring without the last x characters

     e.g.:

     ```swift
     let test = "abc!"
     let test2 = test.substringWithoutLast(1)

     print(test2)
     // "abc"
     ```

     - parameter count: The number of characters to skip from the tail
     - returns: A new string without the last `count` characters
     */
    public func substringWithoutLast(_ count: Int) -> String {
        guard count < self.count else { return "" }

        return self.substringToIndex(self.count - count)!
    }

    // MARK: Subscripting

    /**
     Subscripting with Int instead of indexes

     e.g.:

     ```swift
     let test = "abcdefg"
     print(test[2...4])
     // "cde"
     ```
     */
    public subscript(_ range: CountableClosedRange<Int>) -> String? {
        guard self.count > range.upperBound else { return nil }

        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[start...end])
    }

    /**
     Subscripting with Int instead of indexes

     e.g.:

     ```swift
     let test = "abcdefg"
     print(test[2..<4])
     // "cd"
     ```
     */
    public subscript(_ range: CountableRange<Int>) -> String? {
        guard self.count >= range.upperBound else { return nil }

        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }

    /**
     Subscripting with Int instead of indexes

     e.g.:

     ```swift
     let test = "abcdefg"
     print(test[2...])
     // "cdefg"
     ```
     */
    public subscript(_ range: CountablePartialRangeFrom<Int>) -> String? {
        guard self.count > range.lowerBound else { return nil }

        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        return String(self[start...])
    }

    /**
     Subscripting with Int instead of indexes

     e.g.:

     ```swift
     let test = "abcdefg"
     print(test[...4])
     // "abcde"
     ```
     */
    public subscript(_ range: PartialRangeThrough<Int>) -> String? {
        guard self.count > range.upperBound else { return nil }

        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[...end])
    }

    /**
     Subscripting with Int instead of indexes

     e.g.:

     ```swift
     let test = "abcdefg"
     print(test[..<4])
     // "abcd"
     ```
     */
    public subscript(_ range: PartialRangeUpTo<Int>) -> String? {
        guard self.count >= range.upperBound else { return nil }

        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[..<end])
    }

    /**
     Subscripting with Int instead of indexes

     e.g.:

     ```swift
     let test = "abcdefg"
     print(test[2])
     // "c"
     ```
     */
    public subscript(_ index: Int) -> Character? {
        guard self.count > index else { return nil }

        let inx = self.index(self.startIndex, offsetBy: index)
        return self[inx]
    }

    public subscript(_ result: NSTextCheckingResult) -> String {
        let start = self.index(self.startIndex, offsetBy: result.range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: result.range.upperBound)
        return String(self[start..<end])
    }
}
