// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct aoc2025 {
    static func main() {
        let day = 2
        let dayCode = DataSource.code(forDay: day)
        print("Day \(day) - Part 1:\n\(dayCode.part1())\n")
        print("Day \(day) - Part 2:\n\(dayCode.part2())\n")
    }
}
