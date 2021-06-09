import UIKit

var str = "Hello, playground"

func maxConnectedCells(binaryMatrix: [[Int]]) -> Int {
    var maxConnectedCellCount = 0
    var matrix = binaryMatrix

    var numOfisLands: Int = 0
    
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            if matrix[row][col] == 1 {
                let connectCellCount = connectedCellCount(row: row, col: col, matrix: &matrix)
                maxConnectedCellCount = max(maxConnectedCellCount, connectCellCount)
                print(connectCellCount)
            }
        }
    }
    return maxConnectedCellCount
}

func connectedCellCount(row: Int, col: Int, matrix: inout [[Int]]) -> Int {
    var cellCount = 1
    
    matrix[row][col] = 0
    for rowIndex in max(0, row - 1)...min(matrix.count - 1, row + 1) {
        for colIndex in max(0, col - 1)...min(matrix[0].count - 1, col + 1) {
            if !(row == rowIndex && col == colIndex) && matrix[rowIndex][colIndex] == 1 {
                cellCount += connectedCellCount(row: rowIndex, col: colIndex, matrix: &matrix)
            }
        }
    }
    
    return cellCount
}


let matrix = [
    [1, 1, 0, 1],
    [0, 0, 0, 0],
    [0, 1, 1, 0],
    [1, 0, 0, 1]
]

print(maxConnectedCells(binaryMatrix: matrix))
