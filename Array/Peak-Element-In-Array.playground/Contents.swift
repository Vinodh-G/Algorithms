import UIKit

var str = "Hello, playground"

// Given an array of integers A, find and return the peak element in it.
// An array element is peak if it is NOT smaller than its neighbors.
// For corner elements, we need to consider only one neighbor.
// For example, for input array {5, 10, 20, 15}, 20 is the only peak element.

func peak(arr: [Int]) -> Int? {
    guard !arr.isEmpty else { return nil }

    var start = 0
    var end = arr.count - 1

    while start <= end {
        let mid = (start + end) / 2
        if mid > 0,  mid < arr.count - 1 {
            if arr[mid] > arr[mid - 1],  arr[mid] > arr[mid + 1] {
                return arr[mid]
            } else if arr[mid] < arr[mid - 1] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        } else if mid == 0, arr[mid] > arr[mid + 1] {
            return arr[mid]
        } else if mid == (arr.count - 1),  arr[mid] > arr[mid - 1] {
            return arr[mid]
        }
    }

//    var peak: Int = arr[0]
//
//    for index in 0..<arr.count {
//        let item = arr[index]
//        if index > 0, index < arr.count - 2 {
//            if item > arr[index - 1], item >  arr[index + 1] {
//                peak = max(peak, item)
//            }
//        } else if index == 0 {
//            if item > arr[index + 1] {
//                peak = max(peak, item)
//            }
//        } else {
//            if item > arr[index - 1] {
//                peak = max(peak, item)
//            }
//        }
//    }

    return nil
}

print(peak(arr: [5, 10, 20, 15]) ?? -1)
print(peak(arr: [1, 2, 3, 4, 5]) ?? -1)
print(peak(arr: [18, 33, 100, 135, 203, 270, 292, 310, 356, 392, 400, 429, 436, 461, 427, 403, 399, 375, 251, 245, 173, 130, 43]) ?? -1)
