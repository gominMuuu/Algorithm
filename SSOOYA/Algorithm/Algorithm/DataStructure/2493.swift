//
//  2493.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/03.
//

import Foundation

typealias Element = Tower

struct Tower{
    let id: Int
    let height: Int
}

struct Stack{
    private var data = [Element]()
    
    mutating func push(_ element: Element){
        data.append(element)
    }
    
    mutating func pop() -> Element?{
        let remove = data.last
        data.removeLast()
        return remove
    }
    
    func peek() -> Element?{
        data.last
    }
    
    func isEmpty() -> Bool{
        return data.count == 0
    }
}

let count = Int(readLine()!)!
let towerData = readLine()!.split(separator: " ").map({ Int($0)! })

var stack = Stack()

var result: String = ""

for towerNumber in 1...towerData.count{
    
    while(!stack.isEmpty()){
        if(stack.peek()!.height > towerData[towerNumber-1]){
            result.write(" \(stack.peek()!.id)")
            break
        }
        _ = stack.pop()
    }
    if(towerNumber == 1){
        result = "0"
    }else if(stack.isEmpty()){
        result.write(" 0")
    }
    
    stack.push(Tower(id: towerNumber, height: towerData[towerNumber-1]))
}
print(result)
