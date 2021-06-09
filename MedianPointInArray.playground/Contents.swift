import UIKit

let array = [1, 4, 2, 5]


func getEqualibirium(array: [Int]) -> Int? {

    guard array.count > 0,
        let firstItem = array.first,
        let lastItem = array.last else { return nil }

//    var leftArray: [Int] = Array(repeating: 0, count: array.count)
//    var rightArray:[Int] = Array(repeating: 0, count: array.count)
//
//    leftArray[0] = firstItem
//    for index in 1...(array.count - 1) {
//        leftArray[index] = leftArray[index - 1] + array[index]
//    }
//
//    rightArray[array.count - 1] = lastItem
//    for index in (0...(array.count - 2)).reversed() {
//        print(index)
//        rightArray[index] = rightArray[index + 1] + array[index]
//    }
//
//
//    print("Left: \(leftArray)");
//    print("Right: \(rightArray)");
//
//    for index in 0..<array.count {
//        if leftArray[index] == rightArray[index] {
//            return array[index]
//        }
//    }


    var leftSum = 0
    var rightSum = array.reduce(0) { (result, item) -> Int in
        return result + item
    }
    rightSum -= firstItem
    for index in 1..<(array.count - 1) {
        rightSum = rightSum - array[index]
        leftSum = leftSum + array[index - 1]

        print("LS: \(leftSum) == RS \(rightSum)")

        if leftSum == rightSum {
            return index
        }
    }

    return nil
}

let result = getEqualibirium(array: array)

let array2 = [-1, 5, 4, 7, 8]

print(getEqualibirium(array: array2) ?? -1)
