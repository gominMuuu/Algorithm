//
//  18258.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/04.
//

import Foundation

struct Queue{
    var data = [Int]()
    
    mutating func push(_ element: Int){
        data.append(element)
    }
    
    mutating func pop() -> Int{
        isEmpty() ? -1 : data.removeFirst()
    }
    
    func size(){
        print(data.count)
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
    
    func front(){
        print(data.first ?? -1)
    }
    
    func back(){
        print(data.last ?? -1)
    }
}

let fileIO = FileIO()
var queue = Queue()

let commandCount = fileIO.readInt()

for _ in 1...commandCount{
    
    let command = fileIO.readString()
    
    switch command{
    case "push":
        let input = fileIO.readInt()
        queue.push(input)
        continue
    case "pop":
        print(queue.pop())
        continue
    case "size":
        queue.size()
        continue
    case "empty":
        queue.isEmpty() ? print("1") : print("0")
        continue
    case "front":
        queue.front()
        continue
    case "back":
        queue.back()
        continue
    default:
        continue
    }
}

