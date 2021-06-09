import UIKit

var str = "Hello, playground"

func verticalOrderTraversal(node: Node<Int>?) -> [[Int]] {
    var hash: [Int: [Int]] = [:]
    verticalTraversal(node: node, hash: &hash, dist: 0)
    
    var list: [[Int]] = []
     hash.forEach { (key, values) in
        list.append(values)
    }
    
    return list
}

func verticalTraversal(node: Node<Int>?, hash: inout [Int: [Int]], dist: Int) {
    guard let rootNode = node else { return }
    if let existingList = hash[dist] {
        hash[dist] = existingList + [rootNode.val]
    } else {
        hash[dist] = [rootNode.val]
    }
    
    verticalTraversal(node: rootNode.left, hash: &hash, dist: dist - 1)
    verticalTraversal(node: rootNode.right, hash: &hash, dist: dist + 1)
}

if let tree = BinaryTree.insertLevelOrder(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]) {
    print(verticalOrderTraversal(node: tree.root))
}
