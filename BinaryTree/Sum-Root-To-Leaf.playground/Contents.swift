import UIKit

var str = "Hello, playground"


/*
 Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.

 An example is the root-to-leaf path 1->2->3 which represents the number 123.

 Find the total sum of all root-to-leaf numbers % 1003.

 Example :

     1
    / \
   2   3
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.

 Return the sum = (12 + 13) % 1003 = 25 % 1003 = 25.
 */

func sumRootToLeaf(node: Node?) -> Int {
    var mainVal = 0;
    sumRTL(root: node, currPath: [], mainVal: &mainVal)
    print(mainVal)
    return mainVal % 1003
}

func sumRTL(root: Node?, currPath: [Int], mainVal: inout Int) {
    guard let node = root else { return }

    let newPath = currPath + [node.val]
    if node.left == nil, node.right == nil {
        let val = pathval(path: newPath)
        mainVal += val
        return
    }

    sumRTL(root: node.left, currPath: newPath, mainVal: &mainVal)
    sumRTL(root: node.right, currPath: newPath, mainVal: &mainVal)
}

func pathval(path: [Int]) -> Int {
    guard !path.isEmpty else { return 0 }
    var base = 1
    var val = 0
    for index in stride(from: path.count - 1, through: 0, by: -1) {
        val += path[index] * base
        base *= 10
    }
    return val
}


/*
        1
       / \
     2     3
    / \   /  \
   4   5  6   7
  /
 8
 
 */
if let tree1 = BinaryTree.levelorderInsert(values: [1, 2, 3, 4, 5, 6, 7, 8]) {
    tree1.disp()
    let sum = sumRootToLeaf(node: tree1.root)
    print(sum)
}

/*
   1
  / \
 2    3
    /
  4
   \
    5
 */

if let tree2 = BinaryTree.levelorderInsert(values: [1, 2, 3, 4, 5, -1, 6, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1]) {
    tree2.disp()
    let sum = sumRootToLeaf(node: tree2.root)
    print(sum)
}

