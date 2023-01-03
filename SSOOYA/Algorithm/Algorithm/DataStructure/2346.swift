//
//  2346.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/03.
//

import Foundation

typealias Node = Balloon

class Balloon: Equatable{
    let index: Int
    let value: Int
    
    var next: Node?
    var pre: Node?
    
    init(index: Int, value: Int){
        self.index = index
        self.value = value
    }
    
    static func == (lhs: Balloon, rhs: Balloon) -> Bool {
        lhs.index == rhs.index
    }
}

struct DoublyLinkedList{
    var head: Node?
    var tail: Node?

    mutating func insert(_ element: Node){
        if(head == nil){
            element.next = element
            element.pre = element
            head = element
            tail = element
            return
        }

        element.pre = tail
        element.next = head
        tail?.next = element
        tail = element
        head?.pre = tail
    }

    mutating func delete(_ element: Node){
        if(head != nil && head == tail){
            head = nil
            tail = nil
            return
        }else if(head == element){
            head?.next?.pre = head?.pre
            head?.pre?.next = head?.next
            head = head?.next
            return
        }else if(tail == element){
            tail?.next?.pre = tail?.pre
            tail?.pre?.next = tail?.next
            tail = tail?.pre
            return
        }
        
        element.pre?.next = element.next
        element.next?.pre = element.pre
    }
}

var dataStructure = DoublyLinkedList()

let size = Int(readLine()!)!
let data = readLine()!.split(separator: " ").map({ Int($0)! })

for i in 0..<data.count {
    let element = Balloon(index: i+1, value: data[i])
    dataStructure.insert(element)
}

var deleteNode = dataStructure.head!
var result = [Int]()

while(true){
    dataStructure.delete(deleteNode)
    result.append(deleteNode.index)
    
    if(dataStructure.head == nil){
        break
    }
    let moveValue = deleteNode.value
    if(moveValue < 0){
        for _ in 0..<abs(moveValue){
            deleteNode = deleteNode.pre!
        }
    }else{
        for _ in 0..<moveValue{
            deleteNode = deleteNode.next!
        }
    }
}

var output: String = "\(result[0])"
for i in 1..<size{
    output.append(" \(result[i])")
}
print(output)
