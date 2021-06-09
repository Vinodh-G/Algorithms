import UIKit

var str = "Hello, playground"

class Node {
    var value: Int
    var left: Node? = nil
    var right: Node? = nil
    init(inValue: Int) {
        value = inValue
    }
}


class BST {
    var root: Node?

    func insert(value: Int) {
        let newNode = Node(inValue: value)
        if root == nil {
            root = newNode
        } else {
            var curr = root
            var previous = curr
            while curr != nil {
                previous = curr
                if let rootValue = curr?.value {
                    curr = value > rootValue ? curr?.right : curr?.left
                }
            }
            if let nodeValue = previous?.value {
                if value > nodeValue {
                    previous?.right = newNode
                } else {
                    previous?.left = newNode
                }
            }
        }
    }

    func inoderTraversal(node: Node?) {
        guard node != nil else { return }
        inoderTraversal(node: node?.left)
        if let nodeValue = node?.value {
            print("-> \(nodeValue)")
        }
        inoderTraversal(node: node?.right)
    }
}

extension BST {

    struct Stack {
        private var items: [Node] = []
        mutating func push(item: Node) {
            items.append(item)
        }

        mutating func pop() -> Node? {
            guard !items.isEmpty else { return nil }
            return items.removeLast()
        }
    }

    private func largest(node: Node?) -> Node? {
        var curr = node
        var prev = curr
        while curr != nil {
            prev = curr
            curr = curr?.right
        }

        return prev
    }

    func get2Largest() -> Int? {

        var curr = root
        var stack = Stack()
        while curr != nil {
            stack.push(item: curr!)
            curr = curr?.right
        }

        let largestNode = stack.pop()
        print(largestNode?.value ?? 0)
        if largestNode?.left == nil {
            return stack.pop()?.value
        } else {
            return largest(node: largestNode?.left)?.value
        }
    }
}

let bst: BST = BST()
//bst.insert(value: 13)
bst.insert(value: 7)
bst.insert(value: 17)
bst.insert(value: 5)
bst.insert(value: 10)
bst.insert(value: 9)
//bst.insert(value: 15)
bst.insert(value: 12)

bst.inoderTraversal(node: bst.root)


//                13
//        7               17
//    5       10      15
//        9


print("----> \(bst.get2Largest())")

