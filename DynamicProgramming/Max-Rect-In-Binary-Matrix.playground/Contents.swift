import UIKit

struct Histogram {
    var values: [Int]
    var maxArea: Int {
        var pStack: [Int] = []
        var area =  0, rightIndex = 0

        while rightIndex < values.count {
            let currBarHeight = values[rightIndex]

            if pStack.isEmpty || currBarHeight >= values[pStack[pStack.count - 1]] {
                pStack.append(rightIndex)
                rightIndex  += 1
            } else  if let topItemIndex = pStack.popLast() {

                let width = pStack.isEmpty ? rightIndex : rightIndex - pStack[pStack.count - 1] - 1
                let newArea = width * values[topItemIndex]
                area = max(area, newArea)

                print(area)
            }
        }

        while  let topItemIndex = pStack.popLast(), let rightIndex = pStack.last {
            let width = pStack.isEmpty ? rightIndex : rightIndex - pStack[pStack.count - 1] - 1
            let newArea = width * values[topItemIndex]
            area = max(area, newArea)
            print(area)

        }

        return area

//        while pos < values.count {
//            let height = values[pos]
//            if pStack.isEmpty || height >= values[pStack[pStack.count - 1]] {
//                pStack.append(pos)
//                pos += 1
//            } else if let topPosition = pStack.popLast() {
//                let width = pStack.isEmpty ? pos : pos - pStack.last! - 1
//                let newArea = values[topPosition] * width
//                print("Width: \(width) Values: \(values[topPosition])")
//                print("New Area: \(newArea)")
//                area =  max(area, newArea)
//            }
//        }
//
//        while let topPosition = pStack.popLast() {
//            let width = pStack.isEmpty ? pos : pos - pStack.last! - 1
//            let newArea = values[topPosition] * width
//
//            area =  max(area, newArea)
//        }
//
//        return area
    }
}

func maxSizeRect(in matrix: [[Int]]) -> Int {
    guard matrix.count > 0, matrix[0].count > 0 else { return -1 }

    var hist =  Histogram(values: matrix[0])
    var maxArea = Int.min
    var histValues: [Int] = matrix[0]
    print(histValues)

    for row in 1..<matrix.count {

        for col in 0..<matrix[0].count {
            if matrix[row][col] == 0 {
                histValues[col] = 0
            } else {
                histValues[col] += matrix[row][col]
            }
        }
        print(histValues)
        hist =  Histogram(values: histValues)
        maxArea =  max(maxArea, hist.maxArea)
    }

    return maxArea
}

let matrix = [[1,1,1,0],
              [1,1,1,1],
              [0,1,1,1],
              [1,1,1,1],
              [1,1,1,1],
              [1,1,1,1]]


//print(maxSizeRect(in: matrix))

let ar = Histogram(values: [6, 2, 4, 5, 4, 1, 6]).maxArea

