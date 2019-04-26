import Foundation

class MinStack {
    
    private(set) var arr = [Int]()
    private var auxiliaryStack = Stack()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        self.arr.append(x)
        let index = arr.count-1
        if index == 0 || (index != 0 && x < arr[auxiliaryStack.top()]) {
            auxiliaryStack.push(index)
        }
    }
    
    func pop() {
        let index = arr.count-1
        let auxiliaryIndex = auxiliaryStack.top()
        if index == auxiliaryIndex {
            auxiliaryStack.pop()
        }
        self.arr.removeLast()
    }
    
    func top() -> Int {
        if self.arr.isEmpty {
            fatalError()
        }
        return self.arr[arr.count-1]
    }
    
    func getMin() -> Int {
        if self.arr.isEmpty {
            fatalError()
        }
        
        return self.arr[auxiliaryStack.top()]
    }
    
    class Stack {
        private(set) var arr = [Int]()
        
        init() {
            
        }
        
        func push(_ x: Int) {
            self.arr.append(x)
        }
        
        func pop() {
            self.arr.removeLast()
        }
        
        func top() -> Int {
            if self.arr.isEmpty {
                fatalError()
            }
            return self.arr[arr.count-1]
        }
    }
}

