import UIKit

/*
 Given a binary tree, invert the binary tree and return it.
 Look at the example for more details.

 Example :
 Given binary tree

      1
    /   \
   2     3
  / \   / \
 4   5 6   7
 invert and return

      1
    /   \
   3     2
  / \   / \
 7   6 5   4

 */

func invert(node: Node?) -> Node? {
    guard let root = node else { return nil }

    let tempNode = Node(val: root.val)
    tempNode.left = invert(node: root.right)
    tempNode.right = invert(node: root.left)

    return tempNode
}

/*
      5
     / \
    2   9
   /
  1
 */

let tree1 = Tree.levelorderInsert(values: [5, 2, 9, 1, -1, -1])
print(tree1.disp())
tree1.root = invert(node: tree1.root)
print(tree1.disp())
