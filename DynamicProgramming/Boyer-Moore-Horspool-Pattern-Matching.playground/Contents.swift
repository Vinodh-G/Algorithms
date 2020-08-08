import UIKit

var str = "Hello, playground"


func indexTable(pattern: String) -> [Character: Int] {

    var table: [Character: Int] = [:]
    guard !pattern.isEmpty else { return table }

    let chars: [Character] = Array(pattern)
    for index in 0..<chars.count {
        table[chars[index]] = pattern.count - index - 1
    }
    return table
}

func patternMatching(string: String, pattern: String) -> Int {
    guard !string.isEmpty, !pattern.isEmpty else { return -1 }

    let table = indexTable(pattern: pattern)
    print(table)
    let strArr: [Character] = Array(string)
    let pattArr: [Character] =  Array(pattern)

    var strIndex = 0
    while strIndex + pattArr.count < (strArr.count - pattArr.count) {
        var patternIndex = pattArr.count - 1

        while pattArr[patternIndex] == strArr[strIndex + patternIndex] {
            patternIndex -= 1
            if patternIndex < 0 {
                return strIndex
            }
        }

        if let shiftVal = table[strArr[strIndex + patternIndex]] {
            strIndex += shiftVal
        } else {
            strIndex += pattArr.count
        }
    }

    return -1
}


print(patternMatching(string: "You can wrap your React Native view in a ScrollView component. This guarantees that your content will always be available and it won't overlap with native views. React Native allows you to determine, in JS, the size of the RN app and provide it to the owner of the hosting RCTRootView. The owner is then responsible for re-laying out the subviews and keeping the UI consistent. We achieve this with RCTRootView's flexibility modes.", pattern: "The owner is then responsible"))
