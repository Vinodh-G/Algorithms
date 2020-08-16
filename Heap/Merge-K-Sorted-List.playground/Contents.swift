
import UIKit

var str = "Hello, playground"

func merge(sortedLists: [[Int]]) -> [Int] {
    guard sortedLists.count > 0 else { return [] }
    var result: [Int] = []
    var minHeap: Heap <Item> = Heap()

    for (index, list) in sortedLists.enumerated() {
        minHeap.insert(element: Item(value: list[0],
                                     itemIndex: 0,
                                     listIndex: index))
    }

    while !minHeap.isEmpty, let minVal = minHeap.deleteTop() {
        result.append(minVal.value)

        if minVal.itemIndex + 1 < sortedLists[minVal.listIndex].count {
            let nextIndex = minVal.itemIndex + 1
            let newItem = Item(value: sortedLists[minVal.listIndex][nextIndex],
                               itemIndex: nextIndex,
                               listIndex: minVal.listIndex)
            minHeap.insert(element: newItem)
        }
    }

    return result
}

struct Item: Comparable {
    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.value < rhs.value
    }

    var value: Int
    var itemIndex: Int
    var listIndex: Int
}

let sortedArr: [[Int]] = [
    [1, 5, 9, 17],
    [2, 2, 2, 2],
    [0, 10, 13],
    [21]
]

print(merge(sortedLists: sortedArr))

