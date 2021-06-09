import UIKit

var str = "Hello, playground"

let arr = [11, 12, 15, 18, 19, 2, 3, 4]

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

func binarySearch(array: [Int], key: Int) -> Int {
    guard array.count > 0 else {
        return -1
    }
    
    var low = 0
    var high = array.count - 1
    
    while  low <= high {
        let mid = (low + high) / 2
        if array[mid] == key {
            return mid
        } else if array[mid] > key {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return -1
}

func searchInRotated(array: [Int], key: Int) -> Int {
    guard !array.isEmpty else {
        return -1
    }
    
    let pivot = rotatedIndex(arr: array)
    if pivot == -1 {
        return binarySearch(array: array, key: key)
    }
    
    if array[pivot] == key {
        return pivot
    } else if array[0] < key {
        return binarySearch(array: Array(array[pivot...(array.count - 1)]), key: key)
    } else {
        return binarySearch(array: Array(array[0...(pivot - 1)]), key: key)
    }
}


print(searchInRotated(array: arr, key: 12))
