import UIKit

var greeting = "Hello, playground"


if let bt: BinaryTree = BinaryTree(array: [1, 2, 3, 4, 5, 6, 7]) {
    bt.disp
    
    print(bt.height)
    print(bt.isBalanced)
}
