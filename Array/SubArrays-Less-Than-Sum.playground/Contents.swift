import UIKit

var str = "Hello, playground"


let array1 = [2, 5, 6]
let sum1 = 10


let array2 = [1, 11, 2, 3, 15]
let sum2 = 10


// Sliding Window technique, were we can keep adding the numbers to sum if it is

func getSubArrays(from arr: [Int], lessthan sum: Int) -> [Int] {
    
    guard !arr.isEmpty else { return [] }
    
    var result: [Int] = []
    
    var start = 0, end = 0
    var currSum = arr[start]
    
    while start < arr.count, end < arr.count {
        
        if currSum < sum {
            end += 1
            
            if end >= start {
                result.append(currSum)
            }
            if end < arr.count {
                currSum += arr[end]
            }
            
        } else {
            currSum -= arr[start]
            start += 1
        }
        
    }
    
//
//    var leftSum: [Int] = []
//    for item in arr {
//        let val = (leftSum.last ?? 0) + item
//        leftSum.append(val)
//    }
//
//    if leftSum[0] < sum {
//        result.append(leftSum[0])
//    }
//
//    print(leftSum)
//
//    for index in 1..<arr.count {
//        for jIndex in index..<arr.count {
//
//            let currSum = leftSum[jIndex] - leftSum[index - 1]
//            if currSum < sum {
//                result.append(currSum)
//            }
//        }
//    }
    
    return result
}


print(getSubArrays(from: array2, lessthan: 10))
