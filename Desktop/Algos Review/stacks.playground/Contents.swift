import UIKit
import CoreGraphics

class Stack {

    private var array = [Int]()
    private var currentTop = -1
    private let maxSize: Int

    init(maxSize: Int) {
        self.maxSize = maxSize
    }

    func isEmpty() -> Bool {
        return currentTop == -1
    }

    func isFull() -> Bool {
        return currentTop == maxSize - 1
    }

    func push(_ element: Int) {
        if isFull() {
            print("Cannot exceed max capacity.")
        } else {
            array.append(element)
            currentTop += 1
        }
    }

    func pop() {
        if isEmpty() {
            print("Stack is empty.")
        } else {
            array.removeLast()
            currentTop -= 1
        }
    }

    func peek() -> Int? {
        if isEmpty() {
            return nil
        } else {
            return array[currentTop]
        }
    }

    func getSize() -> Int {
        return currentTop + 1
    }

    func printStack() {
        for num in array {
            print(num)
        }
    }
}

var stack = Stack(maxSize: 5)
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)
stack.printStack()
stack.peek() == 5
stack.push(6)
stack.isFull() == true
stack.pop()
stack.isFull() == false
stack.peek() == 4
stack.getSize() == 4
stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.isEmpty() == true
stack.peek() == nil
stack.getSize()
