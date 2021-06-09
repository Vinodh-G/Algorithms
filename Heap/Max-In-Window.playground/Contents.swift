import UIKit

var str = "Hello, playground"

var maxHeap = MaxHeap()
maxHeap.insert(item: 1)
maxHeap.insert(item: 3)
maxHeap.insert(item: 7)
maxHeap.insert(item: 2)
maxHeap.insert(item: 9)
maxHeap.insert(item: 6)

print(maxHeap.elements)

print(maxHeap.deleteTop() ?? 0)
print(maxHeap.deleteTop() ?? 0)

