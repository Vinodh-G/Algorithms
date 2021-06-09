import UIKit

var str = "Hello, playground"

func isStringContainsValidWords(string: String, dict: [String]) -> Bool {
    guard !string.isEmpty, !dict.isEmpty else { return false }

    let strArray: [Character] = Array(string)
    let dictSet: Set<String> = Set(dict)

    var dp: [Bool] =  Array(repeating: false, count: string.count + 1)
    dp[0] = true

    for mIndex in 1..<dp.count {
        for sIndex in stride(from: mIndex - 1, through: 0, by: -1) {
            let subString = String(strArray[sIndex...(mIndex - 1)])
            if dp[sIndex], dictSet.contains(subString) {
                dp[mIndex] = true
            }
        }
    }

    print(dp)
    return dp[string.count]
}

//let string1 = "abcdef"
//let dict1 = ["ab", "cd", "ef"]
//
//print(isStringContainsValidWords(string: string1, dict: dict1))


let string2 = "IDeservelearningIDeserve"
let dict2 = ["arrays", "dynamic", "heaps", "IDeserve", "learn", "learning", "linked", "list", "platform", "programming"]

print(isStringContainsValidWords(string: string2, dict: dict2))
