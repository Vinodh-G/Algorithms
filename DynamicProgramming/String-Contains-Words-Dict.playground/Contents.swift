import UIKit

var str = "Hello, playground"

func isStringContainsValidWords(s: String, wordDict: [String]) -> Bool {
    guard !s.isEmpty, !wordDict.isEmpty else { return false }
    let dict = Set(wordDict)
    var dp: [Bool] = Array(repeating: false, count: s.count)

    var dpIdx = 0
    dp[0] = true
    while dpIdx < dp.count {
        for word in wordDict {
            
            let  subString = String(s[dpIdx..<(dpIdx + word.count)])
            print ("SubStr: \(subString) word: \(word)")
            if word == subString {
                dp[dpIdx + word.count] = dp[dpIdx] ? dp[dpIdx] : false
                dpIdx += word.count
                break;
            }
        }
        dpIdx += 1
    }

    return dp[s.count - 1]
}

let string1 = "abcdef"
let dict1 = ["ab", "cd", "ef"]

print(isStringContainsValidWords(s: string1, wordDict: dict1))


//let string2 = "IDeservelearningIDeserve"
//let dict2 = ["arrays", "dynamic", "heaps", "IDeserve", "learn", "learning", "linked", "list", "platform", "programming"]
//
//print(isStringContainsValidWords(s: string2, dict: dict2))


extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < start { return "" }
        return self[start..<end]
    }
}
