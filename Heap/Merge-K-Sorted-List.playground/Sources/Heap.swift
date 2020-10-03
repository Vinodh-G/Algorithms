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
            heapifyDown(from: index)
        }
    }

    public mutating func insert(element: Element) {
        elements.append(element)
        heapifyUp(for: elements.count - 1)
    }

    public mutating func deleteTop() -> Element? {
        guard elements.count > 0 else { return nil }
        elements.swapAt(0, elements.count - 1)
        let deletedItem = elements.popLast()
        heapifyDown(from: 0)
        return deletedItem
    }

    private func parentIndex(for index: Int) -> Int {
        guard index > 0 else {  return -1 }
        return (index - 1) / 2
    }

    private mutating func heapifyDown(from index: Int) {
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
            heapifyDown(from: heapIndex)
        }
    }
    
    private mutating func heapifyUp(for index: Int) {
        let pIndex = parentIndex(for: index)
        
        if pIndex >= 0 {
            if compare(type, elements[index], elements[pIndex]) {
                elements.swapAt(pIndex, index)
                heapifyUp(for: pIndex)
            }
        }
    }
}


// Time Complexity analysis
/*
 
    Creating: creating an heap from array of size n
 
    As we know the all the leaf nodes are heap, but we need to iterate all the non leaf nodes and check if it statisfies the
    heap condition, for example above will use min heap, where root node value is always less than left and right child node.
 
    so we are iterating the array from n/2 through 0 which has linear time of n and inside each iterarion we check heap
    condition and apply heap which a time complexity of log n, where h is height of tree.
 
    time comlexity of creating array into heap is (n log n)
 
 
 
    Insert Element in Heap :
 
    Whenever we insert an element in a heap we always add the element at the end, and then we try to apply heap conditions
    to parent of the last inserted element, and recursively check for there parents, until we reach root element
    
    which will be like iterating through the height of the heap tree
    time comlexity of inserting element into heap is (log n)

 
    Delete Top Element (Smallest/ Biggest) in Heap :

    Whenever we delete top element in a heap we always swap the last element to the top, and then we try to apply
    heapifyDown until it reaches the leaf.
    which will be like iterating through the height of the heap tree
    time comlexity of inserting element into heap is (log n)
 
 */
