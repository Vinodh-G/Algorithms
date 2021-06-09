import UIKit

var str = "Hello, playground"

let arr = [1, 4, 11, 9, 5, 6]

func subArray(arr: [Int], sum: Int) -> [Int] {
    
    guard !arr.isEmpty else { return [] }
    
    var left = 0
    var right = 0
    
    var currSum = 0
    while left <= right, right < arr.count {
        
        if currSum == sum {
            return Array(arr[left...right])
        } else if currSum < sum {
            currSum += arr[right]
            right += 1
        } else {
            currSum -= arr[left]
            left -= 1
        }
    }
    
    return []
}

print(subArray(arr: arr, sum: 14))
