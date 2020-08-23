import UIKit

var str = "Hello, playground"

func containerWithMaxCapacity(lines: [Int]) -> Int {
    guard !lines.isEmpty else { return -1 }

    var leftLine = 0
    var rightLine = lines.count - 1
    var maxArea: Int = Int.min
    while leftLine < rightLine {
        let minHeight = min(lines[leftLine], lines[rightLine])
        maxArea = max(maxArea, minHeight * (rightLine - leftLine))

        if lines[leftLine] < lines[rightLine] {
            leftLine += 1
        } else {
            rightLine -= 1
        }
    }
    return maxArea
}

let lines1 = [1, 5, 4, 3]
print("Max Capacity for lines \(lines1) = \(containerWithMaxCapacity(lines: lines1))")

let lines2 = [1, 8, 6, 2, 5, 4, 8, 3, 7]
print("Max Capacity for lines \(lines2) \(containerWithMaxCapacity(lines: lines2))")

