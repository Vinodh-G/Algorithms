import UIKit

var str = "Hello, playground"

/*
 
 Given an unsorted array of nonnegative integers, find a continuous subarray which adds to a given number.
 
Input: arr[] = {1, 4, 20, 3, 10, 5}, sum = 33
Ouptut: Sum found between indexes 2 and 4
Sum of elements between indices
2 and 4 is 20 + 3 + 10 = 33

Input: arr[] = {1, 4, 0, 0, 3, 10, 5}, sum = 7
Ouptut: Sum found between indexes 1 and 4
Sum of elements between indices
1 and 4 is 4 + 0 + 0 + 3 = 7

*/



func subArray(arr: [Int], sum: Int) -> [Int] {
    
    guard !arr.isEmpty else { return [] }
    
    var left = 0
    var right = 0
    
    var currSum = arr[left]
    while left <= right, right < arr.count {

        print("Sum:\(currSum) Arr: \(arr[left...right])")

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

//print(subArray(arr: [1, 4, 11, 9, 5, 6], sum: 14))

print(subArray(arr: [1, 4, 20, 3, 10, 5], sum: 33))

//print(subArray(arr: [1, 4, 0, 0, 3, 10, 5], sum:7))
