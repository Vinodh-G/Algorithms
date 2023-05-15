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

print(getDiagonal(matrix: matrix))


func printAntiDiag(matrix: [[Int]]) -> Void {
    guard !matrix.isEmpty else { return }
    
    var result: [[Int]] = Array(repeating: [], count: matrix.count * 2)


    for row in 0..<matrix.count {
        for col in stride(from: matrix.count - 1, through: 0, by: -1) {
            
            let index = row + (matrix.count - 1 - col)
            result[index].append(matrix[row][col])
        }
    }
    

    print(result)
}

printAntiDiag(matrix: matrix)
