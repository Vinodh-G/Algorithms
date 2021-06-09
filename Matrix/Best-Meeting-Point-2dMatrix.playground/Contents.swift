import UIKit

/*
 You are given a 2D grid of values 0 or 1, where each 1 marks the home of someone in a group. And the group of two or more people wants to meet and minimize the total travel distance. They can meet anywhere means that there might be a home or not.

 The distance is calculated using Manhattan Distance, where distance(p1, p2) = |p2.x – p1.x| + |p2.y – p1.y|.
 Find the total distance that needs to be traveled to reach the best meeting point (Total distance traveled is minimum).


 Examples:

 Input : grid[][] = {{1, 0, 0, 0, 1},
                    {0, 0, 0, 0, 0},
                    {0, 0, 1, 0, 0}};
 Output : 6
 Best meeting point is (0, 2).
 Total distance traveled is 2 + 2 + 2 = 6

 Input : grid[3][5] = {{1, 0, 1, 0, 1},
                      {0, 1, 0, 0, 0},
                      {0, 1, 1, 0, 0}};
 Output : 11
 
 */

let matrix1: [[Int]] = [[1, 0, 0, 0, 1],
                        [0, 0, 0, 0, 0],
                        [0, 0, 1, 0, 0]]

let matrix2: [[Int]] = [[1, 0, 1, 0, 1],
                        [0, 1, 0, 0, 0],
                        [0, 1, 1, 0, 0]]


func minimumDistanceMeetingPoint(matrix: [[Int]]) -> Int {
    guard !matrix.isEmpty, !matrix[0].isEmpty else { return 0 }
    
    var distance: Int = 0
    var verticalPositions: [Int] = []
    var horizonatalPositions: [Int] = []
    
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            if matrix[row][col] == 1 {
                verticalPositions.append(row)
                horizonatalPositions.append(col)
            }
        }
    }
    
    verticalPositions = verticalPositions.sorted()
    horizonatalPositions = horizonatalPositions.sorted()
    
    let midX = verticalPositions[ verticalPositions.count / 2 ]
    let midY = horizonatalPositions[ horizonatalPositions.count / 2 ]
    
    for row in 0..<matrix.count {
        for col in 0..<matrix[0].count {
            if matrix[row][col] == 1 {
                distance += abs(row - midX) + abs(col - midY)
            }
        }
    }
    
    return distance
}


print(minimumDistanceMeetingPoint(matrix: matrix1))
print(minimumDistanceMeetingPoint(matrix: matrix2))
