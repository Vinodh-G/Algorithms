import UIKit

var str = "Hello, playground"

func maxNonNagativeSubArray(array: [Int]) -> [Int] {
    
    guard !array.isEmpty else { return array }
    
    var index = 0
    
    var maxSum = Int.min, maxLeftIndex = -1, maxRightIndex = -1
    while index < array.count {
        
        while index < array.count, array[index] < 0 {
            index += 1
        }
        
        var sum = 0, currLeftIndex = index, currRightIndex = index
        
        while index < array.count, array[index] >= 0 {
            sum += array[index]
            currRightIndex = index
            index += 1
        }
        
        if sum > maxSum {
            maxLeftIndex = currLeftIndex
            maxRightIndex = currRightIndex
            maxSum = sum
        }
    }
    return Array(array[maxLeftIndex...maxRightIndex])
}


print(maxNonNagativeSubArray(array: [1, 4, -11, 9, 5, -6]))

print(maxNonNagativeSubArray(array: [12, 0, 10, 3, 11]))


