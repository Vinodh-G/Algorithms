import UIKit

var str = "Hello, playground"

//  [1, 3, -1, -3, 5, 3, 6, 7]

func maxValueArray(input: [Int], windowSize: Int) -> [Int] {
    guard input.count > 0, windowSize > 0 else { return [] }

    var result: [Int] = []
    var queue: [Int] = []

    for index in 0..<windowSize {
        while !queue.isEmpty, input[index] > input[queue.last!] {
            queue.popLast()
        }
        queue.append(index)
    }

    if !queue.isEmpty {  result.append(input[queue[0]]) }

    for index in windowSize..<input.count {

        // Remove the indices out side the window size from queue
        while !queue.isEmpty, queue[0] <= (index - windowSize) {
            queue.remove(at: 0)
        }

        while !queue.isEmpty, input[index] > input[queue.last!] {
            queue.popLast()
        }

        queue.append(index)
        result.append(input[queue[0]])
    }

    return result
}

//func max(items: [Int]) -> Int {
//    var maxValue = Int.min
//    for item in items {
//        maxValue = max(maxValue, item)
//    }
//    return maxValue
//}

//print(maxValueArray(input: [1, 3, -1, -3, 5, 3, 6, 7], windowSize: 3))
//print(maxValueArray(input: [ 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 ], windowSize: 2))


let orderedSet = NSOrderedSet(array: [ 10, 1, 8, 7, 6, 5, 4, 13, 2, 11 ])
print(orderedSet)

