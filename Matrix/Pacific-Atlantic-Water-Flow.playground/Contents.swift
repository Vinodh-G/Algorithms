import UIKit

var greeting = "Hello, playground"

//func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
//    guard !heights.isEmpty else { return [] }
//
//    var pac: Set<[Int]> = Set()
//    var alt: Set<[Int]> = Set()
//
//    for col in 0..<heights[0].count {
//        dfs(row: 0, col: col, height: heights[0][col], visit: &pac, heights: heights)
//        print("Pac: T \(pac)")
//        dfs(row: heights.count - 1, col: col, height: heights[heights.count - 1][col], visit: &alt, heights: heights)
//        print("Alt: B \(alt)")
//    }
//
//    for row in 0..<heights.count {
//        dfs(row: row, col: 0, height: heights[row][0], visit: &pac, heights: heights)
//        print("Pac: L \(pac)")
//        dfs(row: row, col: heights[0].count - 1, height: heights[row][heights[0].count - 1], visit: &alt, heights: heights)
//        print("Alt: R \(alt)")
//    }
//
//
//    var result: [[Int]] = []
//    for row in 0..<heights.count {
//        for col in 0..<heights[0].count {
//            let vertex = [row, col]
//            if pac.contains(vertex) && alt.contains(vertex) {
//                result.append(vertex)
//            }
//        }
//    }
//
//    return result
//}
//
//
//func dfs(row: Int, col: Int, height: Int, visit: inout Set<[Int]>, heights: [[Int]]) {
//    guard !visit.contains([row, col]),
//          row < heights.count && row > -1 && col < heights[0].count && col > -1,
//          heights[row][col] >= height else { return }
//    visit.insert([row, col])
//    dfs(row: row - 1, col: col, height: heights[row][col], visit: &visit, heights: heights)
//    dfs(row: row + 1, col: col, height: heights[row][col], visit: &visit, heights: heights)
//    dfs(row: row, col: col - 1, height: heights[row][col], visit: &visit, heights: heights)
//    dfs(row: row, col: col + 1, height: heights[row][col], visit: &visit, heights: heights)
//}
//
//
//pacificAtlantic([[1,2,2,3,5],
//                 [3,2,3,4,4],
//                 [2,4,5,3,1],
//                 [6,7,1,4,5],
//                 [5,1,1,2,4]])
//

import Foundation

// Complete the 'roundPrice' function below.
//
// The function accepts following parameters:
//  1. basePrice - basePrice, may be positive, zero or negative
//  2. n - number of digits to which price should be rounded, positive or zero.
//
// The function is expected to return a price in cents rounded to the nearest multiple of 10ⁿ.
// Values exactly in-between two multiples should be rounded up (towards +∞).
//
// If price was non-zero, but would become zero after rounding,
// the function should return nearest non-zero multiple of 10ⁿ.
//
// Hint: if you’re getting timeout error for some of the tests,
// then probably you should optimize your solution.

//struct Price {
//    let currency: String
//    let basePrice: Int
//}
//
//extension Price {
//
//    /// Returns the base price rounded to the nearest multiple of 10ⁿ, where n = insignificantPlaces
//    func rounded(to insignificantDigits: Int) -> Int {
//        guard insignificantDigits > 0 else { return 0 }
//        let baseVal: Double = pow(Double(10), Double(insignificantDigits))
//
//        let isNegative = basePrice < 0
//
//        var val = Double(basePrice) / baseVal
//        let remain = basePrice % Int(baseVal)
//        print(val)
//        if (!isNegative && remain >= Int(baseVal) / 2)  {
//            val += 1
//        }
//        print(val)
//        let result = Int((isNegative ? ceil(val) : floor(val)) * baseVal)
//        return result
//    }
//}
//
////let price = Price(currency: "", basePrice: 408581)
////print(price.rounded(to: 5))
////
////let price1 = Price(currency: "", basePrice: 25)
////print(price1.rounded(to: 1))
//
//let price2 = Price(currency: "", basePrice: -3050)
//print(price2.rounded(to: 2))

struct PolygonCount {
    var rhombus: Int
    var parallelogram: Int
    var polygon: Int
    var invalid: Int
}
struct Solution {
    
    /// Provides a struct that contains the counts of squares, rectangles, and other polygons
    static func polygonCount(from lines: [String]) -> PolygonCount {
        var polygon = PolygonCount(rhombus: 0, parallelogram: 0, polygon: 0, invalid: 0)
        
        var polygons = lines.map { $0.components(separatedBy: " ").map { Int($0) ?? 0 } }
        
        for poly in polygons {
            if poly.count < 4 || isValidPoints(points: poly) {
                polygon.invalid += 1
                continue
            }
            
            if isRomBus(points: poly) {
                polygon.rhombus += 1
                continue
            }
            
            if isRectanagle(points: poly) {
                polygon.parallelogram += 1
                continue
            }
            
            if isPolygon(points: poly) {
                polygon.polygon += 1
            }
        }
        return polygon
    }
    
    static func isRomBus(points:[Int]) -> Bool {
        guard points.count == 4 else { return false }
        return points[0] == points[1] && points[1] == points[2] &&
        points[2] == points[3] && points[3] == points[0]
    }
    
    static func isRectanagle(points:[Int]) -> Bool {
        guard points.count == 4 else { return false }
        return points[0] == points[2] && points[1] == points[3]
    }
    
    static func isPolygon(points:[Int]) -> Bool {
        guard points.count > 3 else { return false }
        
        return true
    }
    
    static func inValidPoints(points: [Int]) -> Bool {
        let filtered = points.filter { $0 > 0 }
        
        return filtered.count != points.count
    }
}

let arr = [
    "36 30 36 30",
    "30 36 30 30",
    "15 15 15 15",
    "46 96 90 90 100",
    "100 200 100 200",
    "-100 -100 -100",
    "100",
  ]

let arr1 = ["36 30 36 30",
            "15 15 15 15",
            "46 96 90 100",
            "86 86 86 86",
            "100 200 100 200",
            "-100 200 -100 200"]

print(Solution.polygonCount(from: arr1))
