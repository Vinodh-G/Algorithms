import UIKit

let array = [-1, 0, 1, 2, -1, -4]
let sum = 0

func get3SumIndices(sum: Int, array: [Int]) -> [[Int]]? {
    var sorted = array.sorted()
    print(sorted)
    var result: [[Int]] = []

    for index in 0..<sorted.count - 2 {

        var left = index + 1
        var right = sorted.count - 1
        let leftMost = sorted[index]
        while left < right {
            let newSum = leftMost + sorted[left] + sorted[right]
            print(newSum)
            if sum == newSum {
                result.append([index, left, right])
                while left < right, sorted[left] == sorted [left + 1] { left += 1 }
                while right > left, sorted[right] == sorted [right - 1] { right -= 1 }
                left += 1
                right -= 1
            } else if newSum > sum {
                right -= 1
            } else {
                left += 1
            }
        }
    }
    return result
}

let it = INTPTR_MAX

print(get3SumIndices(sum: 0, array: array))
