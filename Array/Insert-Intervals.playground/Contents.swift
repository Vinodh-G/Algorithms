import UIKit

var str = "Hello, playground"

struct Event {
    let start: Int
    let end: Int
}

func insertNewInterval(events: [[Int]], newEvent: [Int]) -> [[Int]] {
    guard !events.isEmpty else { return [newEvent] }

    let intervalEvents: [Event] = intervalEvts(from: events)
    let newInteralEvent = Event(start: newEvent[0], end: newEvent[1])
    var stack: [Event] = []

    var index = 0
    while index < intervalEvents.count {
        if intervalEvents[index].start > newInteralEvent.start {
            break
        }
        stack.append(intervalEvents[index])
        index += 1
    }

    if let stackTop = stack.last, stackTop.end > newInteralEvent.start {
        stack.popLast()
        stack.append(Event(start: min(stackTop.start, newInteralEvent.start),
                           end: max(stackTop.end, newInteralEvent.end)))
    } else {
        stack.append(newInteralEvent)
    }

    for mIndex in index..<intervalEvents.count {
        let currInterval = intervalEvents[mIndex]
        if let stackTop = stack.last, stackTop.end > currInterval.start {
            stack.popLast()
            let event = Event(start: min(stackTop.start, currInterval.start),
                              end: max(stackTop.end, currInterval.end))
            stack.append(event)
        } else {
            stack.append(currInterval)
        }
    }
    return stack.map { [$0.start,  $0.end] }
}

func intervalEvts(from intervals: [[Int]]) -> [Event] {
    guard !intervals.isEmpty else { return [] }
    let events = intervals.map{ Event(start: $0[0], end: $0[1]) }
    return events
}

let testcase1 = [[1,2],[3,5],[6,7],[8,10],[12,16]]
print(insertNewInterval(events: testcase1, newEvent: [4,9]))  // [1, 2] [3, 10] [12, 16]


let testcase2 = [[1,3],[4,5],[6,7],[10,12]]
print(insertNewInterval(events: testcase2, newEvent: [8,9]))  // [1, 3] [4, 5] [6, 7] [8, 9] [10, 12]
