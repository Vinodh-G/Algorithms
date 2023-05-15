import Foundation

public class BST <Element: Hashable> {
    public var root: Node <Element>? = nil
    
    public static func minHeightTree(nodes: [Element]) -> BST {
        let bst = BST()
        bst.root = bst.minHeightTree(nodes: nodes, low: 0, high: nodes.count - 1)
        return bst
    }
    
    private let delimitor = "Delimitor"
    
    func minHeightTree(nodes: [Element],
                       low: Int,
                       high: Int) -> Node <Element>? {
        guard !nodes.isEmpty, low <= high else { return nil }
        
        let mid = (low + high) / 2
        let node = Node(val: nodes[mid])
        node.left = minHeightTree(nodes: nodes, low: low, high: mid - 1)
        node.right = minHeightTree(nodes: nodes, low: mid + 1, high: high)
        
        return node
    }
    
    public var disp: Void {
        
        guard let node = root else { return }
        
        var queue: [Any] = []
        
        queue.append(node)
        queue.append(delimitor)
        
        while !queue.isEmpty {
            
            let currItem = queue.removeFirst()
            
            if let currNode = currItem as? Node<Element> {
                
                    print(currNode.val, terminator: "")
                    if let leftNode = currNode.left {
                        queue.append(leftNode)
                    }
                
                    if let rightNode = currNode.right {
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
}

extension Hashable {
    static var delimit: String {
        return "Delimitor"
    }
}

public class Node <Element> {
    
    init(val: Element) {
        self.val = val
    }
    
    public let val: Element
    public var left: Node<Element>?
    public var right: Node<Element>?
}
