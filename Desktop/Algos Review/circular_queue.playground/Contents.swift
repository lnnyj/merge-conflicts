import UIKit

class CircularQueue {

    private var queue = [Int]()
    private var front = -1
    private var rear = -1
    private let capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
    }

    func isFull() -> Bool {
        if (front == 0) && (rear == capacity - 1) {
            return true
        }

        if (front == rear + 1) {
            return true
        }

        return false
    }

    func isEmpty() -> Bool {
        return front == -1
    }

    func enqueue(with element: Int) {
        if isFull() {
            print("Queue is full.")
        } else {
            if rear == capacity - 1 {
                rear = 0
                queue[rear] = element
            } else {
                if front == -1 && rear == -1 {
                    front = 0
                    rear = 0
                    queue.append(element)
                } else {
                    queue.append(element)
                    rear += 1
                }
            }
        }
    }

    func dequeue() {
        if isEmpty() {
            print("Queue is empty.")
        } else {
            if front == rear {
                queue.removeFirst()
                front = -1
                rear = -1
            } else {
                queue[front] = 0
                front += 1
            }
        }
    }

    func printCircularQueue() {
        if isEmpty() {
            print("Queue is empty.")
        } else {
            print("Front -> Index \(front), Item \(queue[front])")
            print("In queue:")
            for (index, num) in queue.enumerated() {
                print("Item \(num) at Index \(index)")
            }
            print("Rear -> Index \(rear), Item \(queue[rear])")
        }
    }
}

var circularQueue = CircularQueue(capacity: 5)
circularQueue.enqueue(with: 1)
circularQueue.enqueue(with: 2)
circularQueue.enqueue(with: 3)
circularQueue.enqueue(with: 4)
circularQueue.enqueue(with: 5)
circularQueue.printCircularQueue()

// Fails to enqueue extra element bc front == 0 and rear == 4
circularQueue.enqueue(with: 6)

circularQueue.dequeue()
circularQueue.printCircularQueue()

// Enqueue another element
circularQueue.enqueue(with: 7)
circularQueue.printCircularQueue()

// Fails to enqueue extra element bc front == rear + 1
circularQueue.enqueue(with: 8)
