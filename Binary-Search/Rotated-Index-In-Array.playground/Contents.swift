import UIKit

var str = "Hello, playground"

let arr = [11, 12, 15, 18, 19, 2, 3, 4]
let arr2 = [11, 2, 5, 8, 9]

func rotatedIndex(arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    var array = arr
    return rotatedIndex(arr: &array, low: 0, high: arr.count - 1)
}

func rotatedIndex(arr: inout [Int], low: Int, high: Int) -> Int {
    
    guard low <= high else { return -1 }
    
    let mid = (low + high) / 2
    
    if (mid + 1) < arr.count,  arr[mid] > arr[mid + 1] {
        return mid + 1
    } else if arr[low] < arr[mid] {
        return rotatedIndex(arr: &arr, low: mid + 1, high: high)
    } else if arr[mid] < arr[high] {
        return rotatedIndex(arr: &arr, low: low, high: mid - 1)
    }
    
    return -1
}

//print(rotatedIndex(arr: arr))
print(rotatedIndex(arr: arr2))
