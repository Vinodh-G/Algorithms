import UIKit

var str = "Hello, playground"

func indexTable(pattern: String) -> [Character: Int] {
    guard !pattern.isEmpty else { return [:] }
    var table: [Character: Int] = [:]
    for (index, ch) in pattern.enumerated() {
        table[ch] = pattern.count - index - 1
    }
    return table
}

func patternMatching(string: String, pattern: String) -> Int {
    guard !string.isEmpty, !pattern.isEmpty else { return -1 }

    let shiftTable = indexTable(pattern: pattern)
    print(shiftTable)
    var strIndex: Int = 0
    var patternIndex: Int = pattern.count - 1
    let stringArr: [Character] = Array(string)
    let patternArr: [Character] = Array(pattern)
    
    while (strIndex + patternIndex) < stringArr.count {
        
        patternIndex = pattern.count - 1
        while patternIndex >= 0,
              patternArr[patternIndex] == stringArr[patternIndex + strIndex] {
            patternIndex -= 1
        }
        
        if patternIndex < 0 {
            return strIndex
        }
        
        
        if let shifVal = shiftTable[stringArr[(pattern.count - 1) + strIndex]] {
            strIndex += shifVal
        } else {
            strIndex += pattern.count
        }
        print(strIndex)
    }
    return -1
}

print(patternMatching(string: "aaaaa", pattern: "bba"))

print(patternMatching(string: "This is happening", pattern: "happen"))

print(patternMatching(string: "You can wrap your React Native view in a ScrollView component. This guarantees that your content will always be available and it won't overlap with native views. React Native allows you to determine, in JS, the size of the RN app and provide it to the owner of the hosting RCTRootView. The owner is then responsible for re-laying out the subviews and keeping the UI consistent. We achieve this with RCTRootView's flexibility modes.", pattern: "The owner is then responsible"))
