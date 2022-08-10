import UIKit

class Queue {

    private var array = [Int]()
    private var front = -1
    private var rear = -1
    private var capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
    }

    private func isFull() -> Bool {
        return capacity == array.count
    }

    private func isEmpty() -> Bool {
        return front == -1 && rear == -1
    }

    func enqueue(with element: Int) {
        if isFull() {
            print("Cannot add element into queue. Queue has reached full capacity.")
        } else if front == -1 && rear == -1 {
            array.append(element)
            front += 1
            rear += 1
        } else {
            array.append(element)
            rear += 1
        }
    }

    func dequeue() {
        if isEmpty() {
            print("Cannot remove from queue. Queue is empty.")
        } else if front == rear {
            array.removeFirst()
            front = -1
            rear = -1
        } else {
            array.removeFirst()
            front += 1
        }
    }

    func printQueue() {
        print(array)
    }

}

var queue = Queue(capacity: 5)

// dequeue is not possible on empty queue
queue.dequeue()

// enqueue 5 elements
queue.enqueue(with: 1)
queue.enqueue(with: 2)
queue.enqueue(with: 3)
queue.enqueue(with: 4)
queue.enqueue(with: 5)
queue.printQueue()

// cannot enqueue when queue is full
queue.enqueue(with: 6)

// dequeue front element
queue.dequeue()
queue.printQueue()

// keep dequeuing elements from the front
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.printQueue()
queue.dequeue()
