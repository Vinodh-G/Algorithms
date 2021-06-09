import UIKit

/*
 
K:     Number of assignees available.
T:     Time taken by an assignee to finish one unit
       of job
job[]: An array that represents time requirements of
       different jobs.
 
 */

func getMax(arr: [Int]) -> Int {
    var maxV: Int = Int.min
    arr.forEach { (num) in
        maxV = max(maxV, num)
    }
    return maxV
}


func minTimeRequired(jobs: [Int], noOfpeople: Int, timePerUnit: Int) -> Int {
    
    
    return timePerUnit
}
