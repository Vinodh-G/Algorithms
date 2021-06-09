import UIKit
/*
 Given a matrix of N*M order. Find the shortest distance from a source cell to a destination cell, traversing through limited cells only. Also you can move only up, down, left and right. If found output the distance else -1.
 s represents ‘source’
 d represents ‘destination’
 * represents cell you can travel
 0 represents cell you can not travel
 This problem is meant for single source and destination.
 
 Input : {'0', '*', '0', 's'},
         {'*', '0', '*', '*'},
         {'0', '*', '*', '*'},
         {'d', '*', '*', '*'}
 Output : 6

 Input :  {'0', '*', '0', 's'},
          {'*', '0', '*', '*'},
          {'0', '*', '*', '*'},
          {'d', '0', '0', '0'}
 Output :  -1
 
 */

let matrix1:[[Character]] = [["0", "*", "0", "s"],
                             ["*", "0", "*", "*"],
                             ["0", "*", "*", "*"],
                             ["d", "*", "*", "*"]]

let matrix2: [[Character]] = [["0", "*", "0", "s"],
               ["*", "0", "*", "*"],
               ["0", "*", "*", "*"],
               ["d", "0", "0", "0"]]


struct Path {
    var row: Int
    var col: Int
    var dist: Int
}

func shortestDistBetweenSourceAndDestination(matrix: [[Character]]) -> Int {
    
    guard !matrix.isEmpty, !matrix[0].isEmpty else { return -1 }
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
    
    var sourcePath: Path = Path(row: 0, col: 0, dist: 0)
    
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            if matrix[row][col] == "0" {
                visited[row][col] = true
            }
       
            if matrix[row][col] == "s" {
                sourcePath.row = row
                sourcePath.col = col
            }
        }
    }
    print(sourcePath)
    
    var queue: [Path] = []
    visited[sourcePath.row][sourcePath.col] = true
    queue.append(sourcePath)
    
    while !queue.isEmpty {
        
        let currPath = queue.remove(at: 0)
        
        if matrix[currPath.row][currPath.col] == "d" {
            return currPath.dist
        }
        
        // Move Up
        if currPath.row - 1 >= 0, visited[currPath.row - 1][currPath.col] == false {
            let newPath = Path(row: currPath.row - 1, col: currPath.col, dist: currPath.dist + 1)
            visited[newPath.row][newPath.col] = true
            queue.append(newPath)
        }
        
        // Move Down
        if currPath.row + 1 < matrix.count, visited[currPath.row + 1][currPath.col] == false {
            let newPath = Path(row: currPath.row + 1, col: currPath.col, dist: currPath.dist + 1)
            visited[newPath.row][newPath.col] = true
            queue.append(newPath)
        }
        
        // Move Left
        if currPath.col - 1 < matrix.count, visited[currPath.row][currPath.col - 1] == false {
            let newPath = Path(row: currPath.row, col: currPath.col - 1, dist: currPath.dist + 1)
            visited[newPath.row][newPath.col] = true
            queue.append(newPath)
        }
        
        // Move Right
        if currPath.col + 1 < matrix.count, visited[currPath.row][currPath.col + 1] == false {
            let newPath = Path(row: currPath.row, col: currPath.col + 1, dist: currPath.dist + 1)
            visited[newPath.row][newPath.col] = true
            queue.append(newPath)
        }
    }
    
    return -1
}

print(shortestDistBetweenSourceAndDestination(matrix: matrix1))
print(shortestDistBetweenSourceAndDestination(matrix: matrix2))
