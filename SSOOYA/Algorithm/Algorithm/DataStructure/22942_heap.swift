//
//  22942.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/09.
//
//  백준 22942번 데이터 체커
//  https://www.acmicpc.net/problem/22942

import Foundation

struct Point{
    let id: Int //Circle id
    let x: Int
}

typealias Element = Point
struct Stack{
    
    private var data = [Element]()
    
    mutating func push(_ element: Element){
        data.append(element)
    }
    
    mutating func pop() -> Element{
        data.removeLast()
    }
    
    func peek() -> Element?{
        data.last
    }
    
    func size() -> Int{
        data.count
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
}

struct Heap{
    
    private var data = [Element]()
    
    mutating func enqueue(_ element: Element){
        data.append(element)
    }
    
    mutating func dequeue() -> Element{
        data.removeFirst()
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
    
    mutating func sort(){
        data.sort(by: {$0.x < $1.x})
    }
}

let fileIO = FileIO()
let amount = fileIO.readInt()

var circlePoints = Heap()
for id in 0..<amount{
    let center = fileIO.readInt()
    let radius = fileIO.readInt()
    circlePoints.enqueue(Point(id: id, x: center - radius))
    circlePoints.enqueue(Point(id: id, x: center + radius))
}

circlePoints.sort(by: {$0.x < $1.x})

var stack = Stack()

while(!circlePoints.isEmpty()){
    
    let deque = circlePoints.dequeue()
    
    if(stack.isEmpty()){
        stack.push(deque)
        continue
    }
    
    let peek = stack.peek()!
    
    if(peek.x == deque.x){
        print("NO")
        exit(0)
    }
    
    if(peek.id == deque.id){
        _ = stack.pop()
        continue
    }
    
    stack.push(deque)
}

stack.isEmpty() ? print("YES") : print("NO")
