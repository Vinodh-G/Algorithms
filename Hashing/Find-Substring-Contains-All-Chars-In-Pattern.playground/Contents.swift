import UIKit

var str = "Hello, playground"

func findSubstringContainingAllCharsFromString(string: String, pattern: String) -> String? {
    guard !string.isEmpty, !pattern.isEmpty else {
        return nil
    }

    var hash: [Character: Int] = [:]
    let strArr: [Character] = Array(string)
    var charsFound = 0

    for char in pattern {
        if let val = hash[char] {
            hash[char] = val + 1
        } else {
            hash[char] = 1
        }
    }

    var leftI = 0
    var buffer: [Character: Int] = [:]
    for rightI in 0..<string.count {
        let ch = strArr[rightI]
        if let val = buffer[ch] {
            buffer[ch] = val + 1
        } else {
            buffer[ch] = 1
        }

        if let patternChCount = hash[ch],
            let strChCount = buffer[ch],  strChCount <= patternChCount {
            charsFound += 1
        }

        while leftI <= rightI, charsFound == pattern.count {
            let ch = strArr[leftI]
            if let val = buffer[ch] {
                 buffer[ch] = val - 1
            }

            if let patternChCount = hash[ch],
                let strChCount = buffer[ch],  strChCount < patternChCount {
                charsFound -= 1
            }
            leftI += 1
            print(strArr[leftI...rightI])
        }

    }
    return ""
}

print(findSubstringContainingAllCharsFromString(string: "ACABDEAABCF", pattern: "ABC") ?? "->")
