//
//  File.swift
//  Algorithms
//
//  Created by Vinodh Govindaswamy on 02/12/19.
//  Copyright © 2019 Vinodh Govindaswamy. All rights reserved.
//

import Foundation
import UIKit

class Algorithms {

    func getNthlargest(from array: [Int], n: Int) -> Int? {
        guard !array.isEmpty else { return nil }
        var arr = array
        return getLargest(array: &arr,
                          position: n,
                          left: 0,
                          right: array.count - 1)
    }

    func getLargest(array: inout [Int],
                    position: Int,
                    left: Int,
                    right: Int) -> Int? {
        guard left < right, array.count > 0 else { return 0 }

        let partisionIndex = partitionIdx(array: &array, left: left, right: right)

        if partisionIndex == position {
            return array[partisionIndex]
        } else if partisionIndex > position {
            return getLargest(array: &array,
                              position: position,
                              left: left,
                              right: partisionIndex - 1)
        } else {
            return getLargest(array: &array,
                              position: position,
                              left: partisionIndex + 1,
                              right: right)
        }
    }

    func partitionIdx(array: inout [Int], left: Int, right: Int) -> Int {
        guard array.count > 0, left < right,right < array.count else { return right }
        let pivot = array[right]
        var partI = left

        for index in left..<right  {
            if array[index] <= pivot {
                array.swapAt(partI, index)
                partI += 1
            }
        }
        array.swapAt(right, partI)
        return partI
    }

//    func getLargest(from array: [Int],
//                    position: Int,
//                    left: Int,
//                    right: Int) -> Int? {
//        guard array.count > 0, left < right else { return nil }
//
//        let (partitionIndex, partitionedArray) = partitionIdx(from : array,
//                                          left: left,
//                                          right: right)
//        if partitionIndex == position {
//            return array[partitionIndex]
//        } else if partitionIndex < position {
//            return getLargest(from: partitionedArray,
//                              position: position,
//                              left: partitionIndex + 1,
//                              right: right)
//        } else {
//            return getLargest(from: partitionedArray,
//                              position: position,
//                              left: left,
//                              right: partitionIndex - 1)
//        }
//    }
//
//    func partitionIdx(from array: [Int], left: Int, right: Int) -> (Int, [Int]) {
//        guard array.count > 0, left < right else { return (right, array) }
//        var sorted = array
//        let pivot = sorted[right]
//        var pIndex = left
//
//        for index in left..<right {
//            if sorted[index] < pivot {
//                sorted.swapAt(index, pIndex)
//                pIndex += 1
//            }
//        }
//        sorted.swapAt(pIndex, right)
//
//        return (pIndex, sorted)
//    }

//    func getLargest(from array: [Int],
//                    position: Int,
//                    left: Int,
//                    right: Int) -> Int {
//
//        let (partitionIndex, partitionedArray) = partition(array: array,
//                                       left: left,
//                                       right: right)
//
//        if partitionIndex == position { return partitionedArray[partitionIndex] }
//        else if partitionIndex > position {
//
//            return getLargest(from: partitionedArray,
//                              position: position,
//                              left: left, right: partitionIndex - 1)
//        } else {
//            return getLargest(from: partitionedArray,
//                              position: position,
//                              left: partitionIndex + 1,
//                              right: right)
//        }
//    }

    //[ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ] start = 0
    //[ 0, 10, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ] index = 1 -> start = 1
    //[ 0, 3, 10, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ] index = 2 -> start = 2
    //[ 0, 3, 10, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ] index = 3 -> start = 2
    //[ 0, 3, 2, 9, 10, 14, 26, 27, 1, 5, 8, -1, 8 ] index = 4 -> start = 3
    //[ 0, 3, 2, 9, 10, 14, 26, 27, 1, 5, 8, -1, 8 ] index = 5 -> start = 3
    //[ 0, 3, 2, 9, 10, 14, 26, 27, 1, 5, 8, -1, 8 ] index = 6 -> start = 3
    //[ 0, 3, 2, 9, 10, 14, 26, 27, 1, 5, 8, -1, 8 ] index = 7 -> start = 3
    //[ 0, 3, 2, 1, 10, 14, 26, 27, 9, 5, 8, -1, 8 ] index = 8 -> start = 4
    //[ 0, 3, 2, 1, 5, 14, 26, 27, 9, 10, 8, -1, 8 ] index = 9 -> start = 5
    //[ 0, 3, 2, 1, 5, 8, 26, 27, 9, 10, 14, -1, 8 ] index = 10 -> start = 6
    //[ 0, 3, 2, 1, 5, 8, 26, 27, 9, 10, 14, -1, 8 ] index = 11 -> start = 6
    //[ 0, 3, 2, 1, 5, 8, -1, 27, 9, 10, 14, 26, 8 ] index = 12 -> start = 7

    //[ 0, 3, 2, 1, 5, 8, -1, X, X, X, X, X, X ] index = 1 -> start = 0

    //[ -1, 3, 2, 1, 5, 8, 0, X, X, X, X, X, X ] index = 1 -> start = 0
    //[ X, 3, 2, 1, 5, 8, 0, X, X, X, X, X, X ]
    //[ X, 0, 2, 1, 5, 8, 3, X, X, X, X, X, X ]
    //[ X, X, 2, 1, 5, 8, 3, X, X, X, X, X, X ];

    private func partition(array: [Int], left: Int, right: Int) -> (Int, [Int]) {
        var sorted = array
        let pivot = array[right]
        var startIndex = left
        for index in left..<right {
            if array[index] <= pivot {
                (sorted[startIndex], sorted[index]) = (sorted[index], sorted[startIndex])
                startIndex += 1
            }
        }
        (sorted[startIndex], sorted[right]) = (sorted[right], sorted[startIndex])
        return (startIndex, sorted)
    }

    private func swap( element1: inout Int, element2: inout Int) {
        let temp = element1
        element1 = element2
        element2 = temp
    }


    func quicksort<T: Comparable>(_ a: [T]) -> [T] {
        guard a.count > 1 else { return a }

        let pivot = a[a.count/2]
        let less = a.filter { $0 < pivot }
        let equal = a.filter { $0 == pivot }
        let greater = a.filter { $0 > pivot }

        return quicksort(less) + equal + quicksort(greater)
    }

    func qsort(_ array: [Int]) -> [Int] {
        guard array.count > 0 else { return array }
        let pivot = array[array.count/2]
        let leftValues = array.filter { $0 < pivot}
        let equalValues = array.filter { $0 == pivot}
        let rightValues = array.filter { $0 > pivot}

        return quicksort(leftValues) + equalValues + quicksort(rightValues)
    }
}

extension String {

    var isUnique: Bool {
        guard !isEmpty else { return false }

        var charCache: [Character: Int] = [:]
        for ch in self {

            if charCache[ch] != nil {
                return false
            } else {
                charCache[ch] = 1
            }
        }

        return true
    }

    func isPermutaion(of string: String) -> Bool {
        guard !isEmpty || !string.isEmpty,
            count == string.count else { return false }

        var charCache: [Character: Int] = [:]
        for ch in self {
            if let frequency = charCache[ch] {
                charCache[ch] = frequency + 1
            } else {
                charCache[ch] = 1
            }
        }

        for ch in string {
            if let frequency = charCache[ch] {
                charCache[ch] = frequency - 1
            } else {
                charCache[ch] = 1
            }
        }

        return charCache.values.filter({ (value) -> Bool in
            return value > 0
        }).count == 0
    }

    var palidromePermutaion: Bool{
        guard !isEmpty else { return false }

        var charCache: [Character: Int] = [:]
        for ch in self {
            if let frequency = charCache[ch] {
                charCache[ch] = frequency + 1
            } else {
                charCache[ch] = 1
            }
        }

        let values = charCache.filter { (key: Character, value: Int)  in
            return value % 2 != 0
        }
        return !(values.count > 1)
    }

    var urlify: String? {
        let string = self.trimmingCharacters(in: CharacterSet(charactersIn: " "))
        guard string.count > 0 else { return nil }
        var newString: String = ""
        for ch in string {

            if ch.isWhitespace {
                newString.append("%20")
            } else {
                newString.append(ch)
            }
        }
        return newString
    }
}
