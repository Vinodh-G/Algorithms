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

public class BinaryTree {
    public var root: Node?

    public static func levelorderInsert(values: [Int]) -> BinaryTree? {
        guard !values.isEmpty else { return nil }
        let tree = BinaryTree()
        tree.root = tree.nodes(values: values)
        return tree
    }

    func nodes(values: [Int], rtIndex: Int = 0) -> Node? {
        guard rtIndex < values.count else { return nil }

        let rootValue = values[rtIndex]
        if rootValue > -1 {
            let root = Node(val: values[rtIndex])
            root.left = nodes(values: values,
                              rtIndex: (2 * rtIndex)  + 1)
            root.right = nodes(values: values,
                               rtIndex: (2 * rtIndex) + 2)
            
            return root
        }
        return nil
    }
    
    public var height: Int {
        func ht(_ node: Node?) -> Int {
            guard node != nil else { return 0 }
            let depth = 1 + max(ht(node?.left), ht(node?.right))
            return depth
        }
        
        return ht(root)
    }
    
    public var diameter: Int {
        func dia(_ node: Node?, _ diaVal: inout Int) -> Int {
            guard node != nil else { return 0 }
            
            let leftHt = dia(node?.left, &diaVal)
            let rightHt = dia(node?.right, &diaVal)
            
            diaVal = max(diaVal, leftHt + rightHt + 1)
            
            let depth = 1 + max(leftHt, rightHt)
            return depth
        }
        
        var diaVal: Int = Int.min
        _ = dia(root, &diaVal)
        return diaVal
    }

    public func disp() {
        guard let root = root else { return }
        
        var json: String = ""
        
        var queue: [Node] = []
        queue.append(root)
        let delimNode = Node(val: Int.min)
        queue.append(delimNode)
        
        var dia = diameter
        json += spaces(for: dia)


        while !queue.isEmpty {

            let node = queue.removeFirst()
            if node.val != delimNode.val {
                json += "\(node.val)"
            } else if node.val == delimNode.val,
                !queue.isEmpty {
                dia -= 1
                json += "\n"
                json += spaces(for: dia)
                queue.append(delimNode)
            }

            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        print(json)
    }
    
    func spaces(for dia: Int) -> String {
        var str = ""
        let spaceCount = dia
        for _ in 0..<spaceCount {
            str += " "
        }
        return str
    }
}
