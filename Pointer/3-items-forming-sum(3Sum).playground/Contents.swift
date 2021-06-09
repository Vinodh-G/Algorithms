import UIKit

var str = "Hello, playground"

let array = [-1, 0, 1, 2, -1, -1, -4]
let sum = 0

func findAll3Sum(items: [Int], sum: Int) -> [[Int]] {
    guard items.count > 2 else { return [items] }

    var result: [[Int]] = []
    let sortedItems = items.sorted()

    for index in 0..<(items.count - 2) {
        let keyItem = sortedItems[index]
        var leftIndex = index + 1
        var rightIndex = sortedItems.count - 1

        while leftIndex < rightIndex {
            let newSum = keyItem + sortedItems[leftIndex] + sortedItems[rightIndex]

            if newSum == sum {
                result.append([keyItem, sortedItems[leftIndex], sortedItems[rightIndex]])
                leftIndex += 1
                rightIndex -= 1
            } else if newSum > sum {
                rightIndex -= 1
            } else  {
                leftIndex += 1
            }
        }
    }

    return result
}


print(findAll3Sum(items: array, sum: 0))
