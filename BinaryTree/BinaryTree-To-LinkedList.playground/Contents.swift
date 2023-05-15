import UIKit

var greeting = "Hello, playground"


if let bt = BinaryTree(array: [1, 2, 3, 4, 5, 6, 7, 8, 9]) {
    bt.disp
    
    let list = bt.depthLists()
    list.map {
        print($0.disp)
    }
}
