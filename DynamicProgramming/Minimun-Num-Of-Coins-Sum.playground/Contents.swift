import UIKit

var str = "Hello, playground"


func minimumNumOfCoins(for amount: Int, coins: [Int]) -> Int {
    guard !coins.isEmpty else { return 0 }
    guard amount > 1 else { return 1 }

    var dp: [Int] = Array(repeating: 999, count: amount + 1)
    dp[0] = 0
    coins.forEach { (coin) in
        dp[coin] = 1
    }
    
    for currentAmt in 1...amount {
        
        var numOfCoins = currentAmt
        for coinVal in coins {
            if currentAmt >= coinVal {
                let dpIndex = currentAmt - coinVal
                numOfCoins = min(numOfCoins, dp[dpIndex] + 1)
            }
        }
        dp[currentAmt] = numOfCoins
    }

    return dp[amount]
}

print(minimumNumOfCoins(for: 9, coins: [1, 3, 5, 7]))
