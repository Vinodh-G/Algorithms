//
//  Robin-Karp.swift
//  Rabin-Karp_Pattern_Matching
//
//  Created by Vinodh Govindaswamy on 29/11/19.
//  Copyright © 2019 Vinodh Govindaswamy. All rights reserved.
//

import Foundation

protocol RabinKarpPatternMatching {
    func contains(pattern: String) -> Bool
    func matchingPatternIndexs(for pattern: String) -> Int?
}

struct Constants {
    static let hashMultiplier = 10
}

extension String: RabinKarpPatternMatching {

    func matchingPatternIndexs(for pattern: String) -> Int? {
        guard self.count > 0, pattern.count > 0 else { return nil }
        let patternHash = hash(for: pattern)
        let str: [Character] = Array(self)
        let window = String(str[0..<pattern.count])
        let windowHash = hash(for: window)
        if windowHash == patternHash { return 0 }

        for strIndex in 1...(str.count - pattern.count) {
            let nextWindow = String(str[strIndex..<(strIndex + pattern.count)])
            let nextHash = hash(for: nextWindow)
            if nextHash == patternHash {
                return strIndex
            }
        }
        return nil
    }

    func nextHash(currHash: Int,
                  prevhCh: Character,
                  nextCh: Character,
                  patternCount: Int) -> Int {
        var hash = Decimal(currHash)
        let preVal = Decimal(prevhCh.asciiValue ?? 0) * pow(10, patternCount - 1)
        hash -= preVal
        hash *= 10
        hash += Decimal(nextCh.asciiValue ?? 0)
        return (hash as NSDecimalNumber).intValue
    }


    func hash(for pattern: String) -> Int {
        var val = 0
        for ch in pattern {
            val += Int(ch.asciiValue ?? 0)
            val *= 10
        }
        return val
    }

    func contains(pattern: String) -> Bool {
        return false
    }

//    let string =  "ccaccaaedba"
//    let pattern = "dba"
//    func matchingPatternIndexs(for pattern: String) -> Int? {
//
//        let patternArray = pattern.compactMap { $0.asciiValue }
//        guard patternArray.count == pattern.count else { return nil } // Patterns contain characters other than ascii characters
//        let textArray = self.compactMap { $0.asciiValue }
//        guard textArray.count == self.count else { return nil } // String contain characters other than ascii characters
//
//        let patternHashValue = hash(array: patternArray)
//        let startWindow = Array(textArray[0...(patternArray.count - 1)])
//        var startHasValue = hash(array: startWindow)
//
//        if patternHashValue == startHasValue {
//            return 0
//        }
//
//        var startIndex = 1
//        while startIndex <= textArray.count - patternArray.count {
//
//            let endIndex = startIndex + patternArray.count - 1
//            let nextWindowArray = Array(textArray[startIndex...endIndex])
//            let nextWindowHashValue = nextHash(prevHash: startHasValue,
//                                               previousChar: textArray[startIndex - 1],
//                                               nextChar: textArray[endIndex],
//                                               exponent: patternArray.count - 1)
//            if nextWindowHashValue == patternHashValue,
//                nextWindowArray == patternArray {
//                return startIndex
//            }
//            startIndex += 1
//            startHasValue = nextWindowHashValue
//        }
//
//        return nil
//
//    }
//
//    public func hash(array: Array<UInt8>) -> Double {
//
//        // if array 234
//        // 2 * pow(constant, array.count - 1) + 3 * pow(constant, array.count - 2) + 4 * pow(constant, array.count - 3)
//        var hashValue: Double = 0
//        var exponent = array.count - 1
//
//        for char in array  {
//            hashValue += Double(char)  * pow(Double(Constants.hashMultiplier), Double(exponent))
//            exponent -= 1
//        }
//        return hashValue
//    }
//
//    public func nextHash(prevHash: Double,
//                         previousChar: UInt8,
//                         nextChar: UInt8,
//                         exponent: Int) -> Double {
//
//        var newHashValue = prevHash - Double(previousChar) * pow(Double(Constants.hashMultiplier), Double(exponent))
//        newHashValue = newHashValue * Double(Constants.hashMultiplier) + Double(nextChar)
//        return newHashValue
//    }
}
