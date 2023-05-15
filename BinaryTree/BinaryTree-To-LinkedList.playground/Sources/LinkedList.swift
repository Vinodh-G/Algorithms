import Foundation

public class LinkedList <Element: Hashable> {

    public var root: ListNode <Element>?
    
    public func add(val: Element) {
        
        let node = ListNode(val: val)
        node.next = root
        root = node
    }
    
    public var disp: Void {
        var node: ListNode? = root
        while node != nil {
            print("<-", terminator: "")
            print(node?.val ?? "", terminator: "")
            node = node?.next
        }
    }
}

public class ListNode <Element: Hashable> {
    public let val: Element
    public var next: ListNode <Element>?
    
    init(val: Element) {
        self.val = val
    }
}
