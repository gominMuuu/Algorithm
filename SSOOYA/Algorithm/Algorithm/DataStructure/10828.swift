//
//  10828.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/09.
//

import Foundation

typealias Element = Int

struct Stack{
    
    private var data = [Element]()
    
    mutating func push(_ element: Element){
        data.append(element)
    }
    
    mutating func pop() -> Element?{
        if(empty()){
            print("-1")
            return nil
        }
        return data.removeLast()
    }
    
    func size() -> Int{
        data.count
    }
    
    func empty() -> Bool{
        data.isEmpty
    }
    
    func top() -> Element?{
        data.last
    }
}

let fileIO = FileIO()
let count = fileIO.readInt()

var stack = Stack()

for _ in 1...count{
    
    let command = fileIO.readString()
    
    switch command{
    case "push":
        let element = fileIO.readInt()
        stack.push(element)
        continue
    case "pop":
        if let pop = stack.pop() {
            print(pop)
            continue
        }
        continue
    case "size":
        print(stack.size())
        continue
    case "empty":
        stack.empty() ? print("1") : print("0")
        continue
    case "top":
        guard let top = stack.top() else {
            print("-1")
            continue
        }
        print(top)
        continue
    default:
        continue
    }
}
