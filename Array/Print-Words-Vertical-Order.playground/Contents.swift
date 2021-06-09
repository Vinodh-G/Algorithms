import UIKit

var str = "Hello, playground"

extension StringProtocol {
    subscript (_ offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

func printWordsInVerticalOrder(string: String) {
    
    let words = string.split(separator: " ")
    print(words)
    
    var maxLength = 0
    for word in words {
        maxLength = max(maxLength, word.count)
    }
    
    var index = 0
    while index < maxLength {
        
        for word in words {
            if index < word.count {
                let ch = word[index]
                print("\(ch)", terminator: " ")
            } else {
                print(" ", terminator: " ")
            }
        }
        print("")
        index += 1
    }
}


printWordsInVerticalOrder(string: "Geeks For Greeks")
