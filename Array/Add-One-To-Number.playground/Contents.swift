import UIKit

var str = "Hello, playground"


func plusOne(numDigits: [Int]) -> [Int] {
    guard !numDigits.isEmpty else { return numDigits }
    
    var result: [Int] = []
    let digitToAdd = 1, base = 10
    var index = numDigits.count - 1
    
    var carry = 0
    let newDigit = numDigits[index] + digitToAdd
    result.append(newDigit % base)
    carry = newDigit / base
    index -= 1
    
    while index >= 0 {
        
        let newDigit = numDigits[index] + carry
        result.append(newDigit % base)
        carry = newDigit / base
        index -= 1
    }
    
    if carry > 0 {
        result.append(carry)
    }
    
    return result.reversed()
}

print(plusOne(numDigits: [9, 9, 9]))

print(plusOne(numDigits: [0, 7, 9, 9]))

print(plusOne(numDigits: [0, 2, 9, 9, 9, 9, 9, 9]))
