import UIKit

/*
     1
  2    3
4   5 6  7
*/

func ancestors(node: Node<Int>?, nodeVal: Int) -> [Int]? {
    return inorderTraversal(node: node, val: nodeVal, values: [])
}

private func inorderTraversal(node: Node<Int>?, val: Int,  values: [Int]) -> [Int]? {
    
    guard let root = node else { return nil }
    if root.val == val {
        return values
    }
    let lefttraversal =  inorderTraversal(node: root.left, val: val, values: values + [root.val])
    let rightTraversal = inorderTraversal(node: root.right, val: val, values: values + [root.val])
    
    return lefttraversal == nil ? rightTraversal : lefttraversal
}
    
if let treeNode = BinaryTree.insertLevelOrder(array: [1, 2, 3, 4, 5, 6, 7])?.root {
    
    if let values = ancestors(node: treeNode, nodeVal: 4) {
        print(values)
    }
}
