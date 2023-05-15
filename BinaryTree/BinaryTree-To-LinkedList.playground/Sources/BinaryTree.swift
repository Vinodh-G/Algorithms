import Foundation

public class BinaryTree <Element: Hashable> {
    
    public var root: Node <Element>?
    public init?(array: [Element]) {
        root = levelInsert(array: array, rootIndex: 0)
    }
    
    private func levelInsert(array: [Element], rootIndex: Int) -> Node <Element>? {
        guard !array.isEmpty, rootIndex >= 0, rootIndex < array.count else { return nil }
        
        let node = Node(val: array[rootIndex])
        node.left = levelInsert(array: array, rootIndex: 2 * rootIndex + 1)
        node.right = levelInsert(array: array, rootIndex: 2 * rootIndex + 2)
        return node
    }
    
    private let delimitor: String = "Delim"
    
    public var disp: Void {
        guard let node = root else { return }
        
        var queue: [Any] = []
        queue.append(node)
        queue.append(delimitor)
        
        while !queue.isEmpty {
            let currItem = queue.removeFirst()
            if let node = currItem as? Node<Element> {
                
                print(node.val, terminator: "")
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
                
            } else if currItem as? String == delimitor {
                print("")
                if !queue.isEmpty {
                    queue.append(delimitor)
                }
            }
        }
    }
    
    
    public func depthLists() -> [LinkedList <Element>] {
        var list: [Int: LinkedList <Element>] = [:]
        depthLists(hash: &list, depth: 0, node: root)
        return list.map { $0.1 }
    }
    
    func depthLists(hash: inout [Int: LinkedList <Element>],
                    depth: Int,
                    node: Node <Element>?) {
        
        guard let currNode = node else { return }
        
        if let list = hash[depth] {
            list.add(val: currNode.val)
            hash[depth] = list
        } else {
        
            let newList: LinkedList <Element> = LinkedList()
            newList.add(val: currNode.val)
            hash[depth] = newList
        }

        depthLists(hash: &hash, depth: depth + 1, node: currNode.left)
        depthLists(hash: &hash, depth: depth + 1, node: currNode.right)
    }
}

public class Node <Element: Hashable> {
    let val: Element
    var left: Node <Element>?
    var right: Node <Element>?
    
    init(val: Element) {
        self.val = val
    }
}
