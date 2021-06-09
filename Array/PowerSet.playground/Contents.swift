import UIKit

var str = "Hello, playground"


func poweSet(array: [Int]) -> [[Int]] {
    guard array.count > 0 else { return [[]] }
    
    let head = array[0]
    let tail = array.dropFirst()
    let tailSet = poweSet(array: Array(tail))
    let result = tailSet.map { [head] + $0 }
    return result + tailSet
    
}

let newAr = [1, 2, 3]
print(poweSet(array: newAr))
