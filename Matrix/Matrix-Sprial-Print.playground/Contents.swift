import UIKit

var str = "Hello, playground"

enum Direction {
    case topLeftToRight
    case topRightbottomRight
    case bottomRighttoLeft
    case bottomLefttoTopLeft
}

func sprialTraveral(matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty else { return [] }
    var result: [Int] = []
  
    var direction: Direction = .topLeftToRight
    var top = 0, bottom = matrix.count - 1
    var left = 0, right = matrix[0].count - 1
    
    while top <= bottom, left <= right {
        switch direction {
        case .topLeftToRight:
            
            for index in left...right {
                result.append(matrix[top][index])
            }
            top += 1
            direction = .topRightbottomRight
            
            
        case .topRightbottomRight:
            
            for index in top...bottom {
                result.append(matrix[index][right])
            }
            
            right -= 1
            direction = .bottomRighttoLeft
            
            
        case .bottomRighttoLeft:
            
            for index in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][index])
            }
            
            bottom -= 1
            direction = .bottomLefttoTopLeft
            
            
        case .bottomLefttoTopLeft:
            
            for index in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[index][left])
            }
            
            left += 1
            direction = .topLeftToRight
        }
    }
    return result
}


let matrix1: [[Int]] = [[1, 2, 3,  4],
                        [5, 6, 7,  8],
                        [9, 10, 11, 12],
                        [13, 14, 15, 16]]

print(sprialTraveral(matrix: matrix1))

let matrix2: [[Int]] = [ [1, 2, 3, 4, 5, 6],
                         [7, 8, 9, 10, 11, 12],
                         [13, 14, 15, 16, 17, 18]]

print(sprialTraveral(matrix: matrix2))
