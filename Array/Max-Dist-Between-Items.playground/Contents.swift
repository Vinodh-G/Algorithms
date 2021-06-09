import UIKit

var str = "Hello, playground"

func maxDist(array: [Int]) -> Int {
    guard !array.isEmpty else { return -1 }

    var minArr: [Int] = Array(repeating: 0, count: array.count)
    var maxArr: [Int] = Array(repeating: 0, count: array.count)
    minArr[0] = array[0]
    for index in 1..<array.count {
        minArr[index] = min(minArr[index - 1], array[index])
    }

    maxArr[array.count - 1] = array[array.count - 1]
    for index in stride(from: array.count - 2, through: 0, by: -1) {
        maxArr[index] = max(maxArr[index + 1], array[index])
    }

    print(minArr)
    print(maxArr)

    var lefIndex = 0
    var rightIndex = 0, maxDiff = -1
    while lefIndex < array.count,
        rightIndex < array.count {
            if minArr[lefIndex] < maxArr[rightIndex] {
                maxDiff = max(maxDiff, abs(rightIndex - lefIndex))
                rightIndex += 1
            } else {
                lefIndex += 1
            }
    }
    return maxDiff
}

print(maxDist(array: [34, 8, 10, 3, 2, 80, 30, 33, 1]))

print(maxDist(array: [9, 2, 3, 4, 5, 6, 7, 8, 18, 0]))
