//
//  Heap.swift
//  
//
//  Created by Vinodh Govindaswamy on 16/08/20.
//

import Foundation

public struct Heap <Element: Comparable> {

    public enum HeapType {
        case max
        case min
    }

    var elements: [Element]
    var type: HeapType = .min

    public var isEmpty: Bool {
        return elements.isEmpty
    }

    var compare: ((HeapType, Element, Element) -> Bool) = { (heapType, leftElement, rightElement) in

        switch heapType {
            case .min: return leftElement < rightElement
            case .max: return leftElement > rightElement
        }
    }

    public init(elements: [Element] = [], heapType: HeapType = .min) {
        self.elements = elements
        self.type = heapType
        for index in stride(from: elements.count / 2, through: 0, by: -1) {
            heapify(from: index)
        }
    }

    public mutating func insert(element: Element) {
        elements.append(element)
        var pIndex = parentIndex(for: elements.count - 1)
        while pIndex >= 0 {
            heapify(from: pIndex)
            pIndex = parentIndex(for: pIndex)
        }
    }

    public mutating func deleteTop() -> Element? {
        guard elements.count > 0 else { return nil }
        elements.swapAt(0, elements.count - 1)
        let deletedItem = elements.popLast()
        heapify(from: 0)
        return deletedItem
    }

    private func parentIndex(for index: Int) -> Int {
        guard index > 0 else {  return -1 }
        return (index - 1) / 2
    }

    private mutating func heapify(from index: Int) {
        let leftIndex = index * 2  + 1
        let rightIndex = leftIndex + 1

        var heapIndex = index

        if leftIndex < elements.count, compare(type, elements[leftIndex], elements[heapIndex]) {
            heapIndex = leftIndex
        }

        if rightIndex < elements.count, compare(type, elements[rightIndex], elements[heapIndex]) {
            heapIndex = rightIndex
        }


        if heapIndex != index {
            elements.swapAt(heapIndex, index)
            heapify(from: heapIndex)
        }
    }
}
