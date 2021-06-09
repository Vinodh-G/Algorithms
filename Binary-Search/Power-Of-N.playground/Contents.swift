import UIKit

var str = "Hello, playground"

var iterations = 0
func power(num: Int, pwr: Int, cache: inout [Int: Int]) -> Int {
    guard pwr > 0 else { return 1 }

    guard cache[pwr] == nil else { return cache[pwr]! }

    iterations = iterations + 1
    if pwr % 2 == 0 {
        let val = power(num: num, pwr: pwr/2, cache: &cache) * power(num: num, pwr: pwr / 2, cache: &cache)
        cache[pwr] = val
        return val
    } else {
        let val = power(num: num, pwr: pwr/2, cache: &cache) * power(num: num, pwr: pwr / 2, cache: &cache) * num
        cache[pwr] = val
        return val
    }
}


var cache: [Int: Int] = [:]

print(power(num: 2, pwr: 10, cache: &cache))
print(iterations)

