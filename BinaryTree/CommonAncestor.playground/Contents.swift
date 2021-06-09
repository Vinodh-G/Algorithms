import UIKit

var str = "Hello, playground"

func commonAncestor(node: Node<Int>, val1: Int, val2: Int) -> Node<Int>? {
    var left: Node<Int>? = nil
    var right: Node<Int>? = nil
    let root = LCA(node: node,
                   left: &left,
                   right: &right,
                   val1: val1,
                   val2: val2)
    if left != nil, right != nil {
        return root
    } else {
        return nil
    }
}

func LCA(node: Node<Int>?,
         left: inout Node<Int>?,
         right: inout Node<Int>?, val1: Int, val2: Int) -> Node<Int>? {
    
    guard let root = node else { return nil }
    
    if root.val == val1 {
        left = root
        return root
    } else if root.val == val2 {
        right = root
        return root
    } else {
        let leftNode = LCA(node: root.left,
                           left: &left,
                           right: &right,
                           val1: val1,
                           val2: val2)
        let rightNode = LCA(node: root.left,
                           left: &left,
                           right: &right,
                           val1: val1,
                           val2: val2)
        if leftNode != nil && rightNode != nil {
            return root
        } else {
            return leftNode != nil ? leftNode : rightNode
        }
    }
}

if let treeNode = BinaryTree.insertLevelOrder(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])?.root {
    print(commonAncestor(node: treeNode, val1: 10, val2: 7)?.val ?? -1001)
}
