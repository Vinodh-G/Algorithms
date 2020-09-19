import Foundation

public class Node{
    public var val: Int
    public var left: Node?
    public var right: Node?
    public init(val: Int, left: Node? = nil, right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}
public class Tree {
    public var root: Node?

    public static func levelorderInsert(values: [Int]) -> Tree {
        let tree = Tree()
        tree.root = tree.nodes(values: values)
        return tree
    }

    func nodes(values: [Int], rtIndex: Int = 0) -> Node? {
        guard !values.isEmpty, rtIndex < values.count else { return nil }

        let rootValue = values[rtIndex]
        if rootValue > -1 {
            let root = Node(val: values[rtIndex])
            root.left = nodes(values: values,
                              rtIndex: (2 * rtIndex) + 1)
            root.right = nodes(values: values,
                               rtIndex: (2 * rtIndex) + 2)
            return root
        }
        return nil
    }
    
    public func disp() {
        guard let root = root else { return }
        var queue: [Node] = []
        queue.append(root)
        let delimNode = Node(val: Int.min)
        queue.append(delimNode)

        while !queue.isEmpty {

            let node = queue.removeFirst()
            if node.val != delimNode.val {
                print(node.val, terminator: " ")
            } else if node.val == delimNode.val,
                !queue.isEmpty {
                print("")
                queue.append(delimNode)
            }

            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        print("")
    }
}
