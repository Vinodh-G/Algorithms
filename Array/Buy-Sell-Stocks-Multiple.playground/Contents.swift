import UIKit

/*
 
 Say you have an array for which the ith element is the price of a given stock on day i.Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time(ie, you must sell the stock before you buy again).URL: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 
 */


func maxProfit(prices: [Int]) -> Int {
    guard !prices.isEmpty else { return -1 }
    
    var peak = prices[0]
    var valley = prices[0]
    var maxProfit = 0
    for pIndex in 1..<prices.count {

        if prices[pIndex] > prices[pIndex - 1] {
            peak = prices[pIndex]

            if pIndex == prices.count - 1 {
                maxProfit = max(maxProfit, maxProfit + (peak - valley))
            }
            
        } else {
            maxProfit = max(maxProfit, maxProfit + (peak - valley))
            valley = prices[pIndex]
            peak = valley
        }
    }
    
    return maxProfit
}

let prices1: [Int] = [7,1,5,3,6,4]
print("\(prices1) profit: \(maxProfit(prices: prices1))")

let prices2: [Int] = [1,2,3,4,5]
print("\(prices2) profit: \(maxProfit(prices: prices2))")

let prices3: [Int] = [7,6,4,3,1]
print("\(prices3) profit: \(maxProfit(prices: prices3))")
