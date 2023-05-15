import UIKit

var greeting = "Hello, playground"

let bst: BST<Int> = BST.minHeightTree(nodes: [1, 2, 3, 4, 5, 6, 7, 8])
bst.disp

let bstStr: BST<String> = BST.minHeightTree(nodes: ["A", "B", "C", "D"])
bstStr.disp
