import Foundation


public struct MaxHeap {
    public init() {}
    public var elements: [Int] = []
    
    public mutating func insert(item: Int) {
        elements.append(item)
        pushUp(index: elements.count - 1)
    }
    
    public mutating  func deleteTop() -> Int? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let itemToDelete = elements.popLast()
        pushdown(index: 0)
        return itemToDelete
    }
    
    mutating private func pushUp(index: Int) {
        let parentIndex = parent(index: index)
        guard parentIndex >= 0 else { return }
        
        if elements[parentIndex] < elements[index] {
            elements.swapAt(parentIndex, index)
            pushUp(index: parentIndex)
        }
    }
    
    mutating private func pushdown(index: Int) {
        
        let leftIndex = index * 2 + 1
        let rightIndex = leftIndex + 1
        
        var maxIndex = index
        if leftIndex < elements.count, elements[leftIndex] > elements[maxIndex] {
            maxIndex = leftIndex
        }
        
        if rightIndex < elements.count, elements[rightIndex] > elements[maxIndex] {
            maxIndex = rightIndex
        }
        
        if maxIndex != index {
            elements.swapAt(maxIndex, index)
            pushdown(index: maxIndex)
        }
        
    }
    
    private func parent(index: Int) -> Int {
        return (index - 1) / 2
    }
    
}
