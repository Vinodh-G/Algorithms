import UIKit

var str = "Hello, playground"

let matrix1: [[Int]] = [[1, 2, 3,  4],
                        [15, 13, 7,  8],
                        [9, 10, 11, 12],
                        [5, 14, 6, 16]]


func sort(matrix: [[Int]]) -> [[Int]] {
    guard !matrix.isEmpty else { return matrix }
    
    // Row Sort the matix
    var sortedMatrix = rowSort(matrix: matrix)
    print(matrix: sortedMatrix)
    sortedMatrix = transpose(matrix: sortedMatrix)
    print(matrix: sortedMatrix)
    sortedMatrix = rowSort(matrix: sortedMatrix)
    print(matrix: sortedMatrix)
    sortedMatrix = transpose(matrix: sortedMatrix)
    
    print("==== FINAL =====")
    print(matrix: sortedMatrix)
    
    return sortedMatrix
}

func rowSort(matrix: [[Int]]) -> [[Int]] {
    guard !matrix.isEmpty else { return matrix }
    
    var sortedMatrix = matrix

    for rowIndex in 0..<matrix.count {
        sortedMatrix[rowIndex] = matrix[rowIndex].sorted()
    }
    return sortedMatrix
}

func transpose(matrix: [[Int]]) -> [[Int]] {
    guard !matrix.isEmpty else { return matrix }
    var transMatrix:[[Int]] = Array(repeating: Array(repeating: 0, count: matrix.count), count: matrix.count)
    
    for rowIndex in 0..<matrix.count {
        for colIndex in 0..<matrix[0].count {
            transMatrix[rowIndex][colIndex] = matrix[colIndex][rowIndex]
        }
    }
    return transMatrix
}

func print(matrix: [[Int]]) {
    for rowIndex in 0..<matrix.count {
        for colIndex in 0..<matrix[0].count {
            print(matrix[rowIndex][colIndex], terminator: " ")
        }
        print("")
    }
    print("\n")
}

print(sort(matrix: matrix1))
