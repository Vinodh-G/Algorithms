import UIKit

var str = "Hello, playground"


let array = [3, 7, 8, 3, 4]
let sum = 10

func getIndexs(of sum: Int, from array:[Int]) -> (Int, Int)? {
    var cache: [Int: Int] = [:]

    for (index, item) in array.enumerated()  {
        let diffValue = sum - item
        print("Item:\(item) Index:\(index) Diff:\(diffValue)")
        if let diffIndex = cache[diffValue] {
            return (index, diffIndex)
        }
        cache[item] = index
        print(cache)
    }
    return nil
}

print(getIndexs(of: 10, from: array))

let array2 = [-3, 7, -8, 3, 4]
let sum2 = -5
print(getIndexs(of: sum2, from: array2))


print("\n Diffenrence")
func getDiffIndexs(of diff: Int, from array: [Int]) -> (Int, Int)? {
    var cache: [Int: Int] = [:]

    //  a - b = diff
    for index in 0..<array.count {
        let b = array[index]
        let a = diff + b
        if cache[b] != nil {
            print("[\(cache[b]), \(index)]")
        } else {
            cache[a] = index
        }
    }

    return nil
}

let array3 = [1, 2, 3, 4, 5]
let diff = 2
print(getDiffIndexs(of: diff, from: array3))
