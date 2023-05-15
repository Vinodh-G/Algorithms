/*
 
 Find the kth largest element in an unsortedarray. Note that it is the kth largest element in the sorted order,not the kth distinct element. For example,Given [3,2,1,5,6,4] and k=2,return 5. Note:Youmayassumekisalwaysvalid,1≤k≤array'slength URL:https://leetcode.com/problems/kth-largest-element-in-an-array
 
*/

import UIKit

func findLargest(k: Int, unsortedArray: [Int]) -> Int {
    
    guard k >= 0, unsortedArray.count > 0 else { return -1 }
    
    return findLargest(k: unsortedArray.count - k,
                       unsortedArray: unsortedArray)
}

func findLargest(k: Int, unsortedArray: [Int], low: Int, high: Int) -> Int {
    var array = unsortedArray
    let pi = partitionIndex(array: &array, low: low, high: high)

    if pi == k {
        return array[pi]
    } else if k < pi {
        return findLargest(k: k, unsortedArray: array, low: low, high: pi - 1)
    } else {
        return findLargest(k: k, unsortedArray: array, low: pi + 1, high: high)
    }
}

func partitionIndex(array: inout [Int], low: Int, high: Int) -> Int {

    var pi = low

    for li in low...high {
        if array[li] < array[high] {
            array.swapAt(li, pi)
            pi += 1
        }
    }
    array.swapAt(pi, high)
    return pi
}

let test1 = [3, 2, 1, 5, 6]
var index = 1
print("\(test1) -> k:\(index) => \(findLargest(k: index, unsortedArray: test1))")


let test2 = [3,2,3,1,2,4,5,5,6]
index = 4
print("\(test2) -> k:\(index) => \(findLargest(k: index, unsortedArray: test2))")
