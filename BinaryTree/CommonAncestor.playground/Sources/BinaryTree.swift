import Foundation

public class BinaryTree <Element> {
    public var root: Node<Element>?
    
    public static func insertLevelOrder(array: [Element]) -> BinaryTree? {
        guard array.count > 0 else { return nil }
        let bt = BinaryTree()
        bt.root = levelOrderInsert(array: array, index: 0)
        return bt
    }
    
    static func levelOrderInsert (array: [Element], index: Int = 0) -> Node <Element>? {
        guard !array.isEmpty, index < array.count else { return nil }

        let root = Node(val: array[index])
        let newIndex = index + 1
        root.left = levelOrderInsert(array: array, index: 2 * newIndex - 1)
        root.right = levelOrderInsert(array: array, index: 2 * newIndex)

        return root
    }
}


public class Node <Element> {
    public let val: Element
    public var left: Node <Element>?
    public var right: Node <Element>?
    
    init(val: Element) {
        self.val = val
    }
}
