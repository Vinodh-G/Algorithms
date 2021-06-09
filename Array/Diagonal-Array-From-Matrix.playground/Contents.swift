import UIKit

var str = "Hello, playground"

let matrix = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]]

func getDiagonal(matrix: [[Int]]) -> [[Int]] {
    guard !matrix.isEmpty else {
        return []
    }
    
    var result: [[Int]] = Array(repeating: [], count: matrix.count * 2)
    
    for rowIndex in 0..<matrix.count {
        for colIndex in 0..<matrix[0].count {
            result[rowIndex + colIndex].append(matrix[rowIndex][colIndex])
        }
    }
    
    return result
}

//print(getDiagonal(matrix: matrix))


func printAntiDiag(matrix: [[Int]]) -> Void {
    guard !matrix.isEmpty else { return }
    
    var result: [[Int]] = Array(repeating: [], count: matrix.count * 2)

    for row in 0..<matrix.count {
        for col in stride(from: matrix[0].count - 1, through: 0, by: -1) {
            result[row + col].insert(matrix[matrix.count - 1 - row][col], at: 0)
        }
    }

//    for index in stride(from: result.count - 1, through: 0, by: -1) {
//        let subItems = result[index]
//        if !subItems.isEmpty {
//            subItems.forEach { print($0) }
//        }
//    }

    print(result)
}

printAntiDiag(matrix: matrix)
