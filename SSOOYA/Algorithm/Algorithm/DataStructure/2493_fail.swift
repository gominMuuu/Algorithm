//
//  2493_fail.swift
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
    private var data = [Int]()
    
    mutating func push(_ element: Int){
        data.append(element)
    }
    mutating func pop() -> Int{
        if(data.isEmpty){
            return 0
        }
        return data.removeLast()
    }
}

struct Deque{
    private var data = [Element]()
    
    mutating func addFront(_ element: Element){
        data.insert(element, at: 0)
    }
    mutating func deleteFront() -> Element{
        let remove = data.first!
        data.removeFirst()
        return remove
    }
    mutating func addRear(_ element: Element){
        data.append(element)
    }
    mutating func deleteRear() -> Element{
        let remove = data.last!
        data.removeLast()
        return remove
    }
    func getDequeSize() -> Int{
        data.count
    }
}

var deque = Deque()

let fileIO = FileIO()
let count = fileIO.readInt()
var towerData = [Int]()

for i in 0..<count{
    let height = Int(fileIO.readString())!
    towerData.append(height)
    deque.addRear(Tower(id: i+1, height: height))
}

let dequeSize = deque.getDequeSize()
var result: String = ""

for towerNumber in 1...count{
    
    var dequeTest = deque
    var stack = Stack()
    
    if(towerNumber == 1){
        result = "0"
        continue
    }else if(towerNumber <= dequeSize / 2){
        //front에서 빼기
        var removeElement: Element!
        repeat{
            removeElement = dequeTest.deleteFront()
            if(removeElement.height > towerData[towerNumber-1]){
                stack.push(removeElement.id)
            }
        }while(removeElement.id != towerNumber)
        result.write(" \(stack.pop())")
        continue
    }
    else{
        //rear에서 빼기
        var removeElement: Element!
        repeat{
            removeElement = dequeTest.deleteRear()
        }while(removeElement.id != towerNumber)
        
        var sender = dequeTest.deleteRear()
        while(sender.height < towerData[towerNumber-1]){
            sender = dequeTest.deleteRear()
        }
        result.write(" \(sender.id)")
    }
}
print(result)
