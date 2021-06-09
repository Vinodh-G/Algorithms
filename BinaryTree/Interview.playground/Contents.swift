import UIKit

var str = "Hello, playground"

/*
Write code to check if a given integer is a palindrome or not?

bool check(int number) {
    
    Ex. 121 = true
    13231 = true
    12 = false
*/

 // 1 * 10 power 2 + 2 * 10 pow 1 + 2 * 10 pow 0

//    digit = (121 % 10) == 1
//     digit = 12 % 10 == 2
//     digit = 1 % 10 == 1


// 10 pow 2,  baseVal, count == for 0..count { baseVal = basVal * baseval }

func check(val: Int) -> Bool {
    
    var revVal: Int = 0
    let base = 10
    var digits = digitsCount(val: val)
    var num = val
    while num > 0 {
        let digit = num % base
        revVal += digit * pow(Decimal(base), digits - 1)
        num = num / base
        digits -= 1
    }
    
    return revVal == val
}

func digitsCount(val: Int) -> Int {
    var num = val
    var digits: Int
    while num > 0 {
        num = num / 10
        digits += 1
    }
    return digits
}


//  10 pow 7
//  10 * 10 * 10 * 10 * 10 * 10 * 10


// 10 pow 3
//-> 0 + 10 * 10 + 100 * 10


func power(base: Int, exp: Int) -> Int {
    
    var value: Int = base
    for index in 0..<exp {
        value *= value
    }
    return value
}
