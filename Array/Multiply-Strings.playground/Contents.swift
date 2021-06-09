import UIKit

var str = "Hello, playground"


func multiply(a: String, b: String) -> String {
    guard !a.isEmpty, !b.isEmpty else { return "" }

    var results: [Int] = Array(repeating: 0, count: a.count + b.count)

    
    let aArr: [Int] = a.map{ Int(String($0))! }
    let bArr: [Int] = b.map{ Int(String($0))! }
    
    print(Int(String(a.last!))!)
    print(Int(String(b.last!))!)
    
    if (a.count == 1 && Int(String(a.last!))! == 0) || (b.count == 1 && Int(String(b.last!))! == 0) { return "0" }

    var mainRowIndex = 0

    for bIndex in stride(from: bArr.count - 1, through: 0, by: -1) {
     
        var carry = 0, digitIndex = 0, rowIndex = mainRowIndex
        for aIndex in stride(from: aArr.count - 1, through: 0, by: -1) {
            
            var val = aArr[aIndex] * bArr[bIndex]

//            digitIndex = results.count - 1 - (aArr.count - aIndex - 1) - rowIndex
            
            val = results[rowIndex] + val + carry
            carry = val / 10
            
//            print("digit: \(digitIndex) Val:\(val) carry:\(carry)")
            results[rowIndex] = val % 10
            rowIndex += 1
            print(results)
        }
        
        while carry > 0  {
            let val = results[rowIndex] + carry
            results[rowIndex] = val % 10
            carry = val / 10
        }
        print("")
        mainRowIndex += 1
    }
    
    return String(results.reversed().map{ Character("\($0)") })
}


print(multiply(a: "123", b: "2"))

print(multiply(a: "93", b: "7"))
