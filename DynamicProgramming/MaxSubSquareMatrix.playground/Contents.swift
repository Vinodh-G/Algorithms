//: A UIKit based Playground for presenting user interface

import Foundation

class MaxSubSqaureMatrix {
    private func minOf(num1:Int, num2:Int, num3:Int) -> Int {
        let rowMin = min(num1, num2)
        return min(rowMin, num3)
    }
    
    
    func maxSubSqaureMatrix(matrix:[[Int]]) -> ([Int], [Int]) {
        let rowCount = matrix.count
        let colCount = matrix[0].count
        var endRowIndex = 0
        var endColIndex = 0
        var max = 0

        var result = matrix
        print("Matrix")
        print(result)
        
        
        for row in 1..<rowCount {
            for col in 1..<colCount {
                if result[row][col] == 0 {
                    continue
                }
                
                let value = minOf(num1: result[row - 1][col], num2: result[row - 1][col - 1], num3: result[row][col-1])
                result[row][col] = value + 1
                
                if result[row][col] > max {
                    max = result[row][col]
                    endRowIndex = row
                    endColIndex = col
                }
            }
        }
        print("Result")
        print(result)
        return ([endRowIndex - max + 1, endColIndex - max + 1], [endRowIndex, endColIndex])
    }
}

var matrix1: [[Int]] = [[0,1,1,0,1],
                        [1,1,1,0,0],
                        [1,1,1,1,0],
                        [1,1,1,0,1]]

var matrix2: [[Int]] = [[0,1,1,0,1],
                        [0,1,1,1,1],
                        [1,1,1,1,1],
                        [1,0,1,1,1],
                        [1,1,1,1,1],
                        [0,1,1,0,1]]

let maxsubmatrix = MaxSubSqaureMatrix()
print("\nMatrix 1 \(maxsubmatrix.maxSubSqaureMatrix(matrix: matrix1))\n")
print("\nMatrix 2 \(maxsubmatrix.maxSubSqaureMatrix(matrix: matrix2))\n")

