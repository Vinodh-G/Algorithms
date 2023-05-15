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
    
    public var height: Int {
        return ht(node: root, currentHt: 0)
    }
    
    func ht(node: Node <Element>?, currentHt: Int) -> Int {
        guard let rtNode = node else { return currentHt }
        
        return max(ht(node:rtNode.left, currentHt:currentHt), ht(node:rtNode.right, currentHt:currentHt)) + 1
    }
    
    
    public var isBalanced: Bool {
        var ht = 0
        return balanced(node: root, currHt: &ht)
    }
    
    func balanced(node: Node <Element>?, currHt: inout Int) -> Bool {
        guard let rtNode = node else { return true }
        
        currHt += 1
        var leftHt = currHt
        var rightHt = currHt
        
        let leftBal = balanced(node: rtNode.left, currHt: &leftHt)
        let rightBal = balanced(node: rtNode.right, currHt: &rightHt)
        
        if abs(leftHt - rightHt) > 1 {
            return false
        }
        
        return leftBal && rightBal
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
