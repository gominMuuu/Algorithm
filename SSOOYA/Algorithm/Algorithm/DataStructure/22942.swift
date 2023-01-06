//
//  22942.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/06.
//
//  백준 22942번 데이터 체커
//  https://www.acmicpc.net/problem/22942

import Foundation

struct Circle{
    let x: Int
    let radius: Int
}

typealias Element = Int

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

let amount = Int(readLine()!)!
var storage = [Circle]()
var stack = Stack()

for _ in 0..<amount{
    let data = readLine()!.split(separator: " ").map({ Int($0)! })
    storage.append(Circle(x: data[0], radius: data[1]))
}

for circle in storage{

    let minPoint = circle.x - circle.radius
    let maxPoint = circle.x + circle.radius

    if(stack.isEmpty() || stack.peek()! < minPoint){
        stack.push(minPoint)
        stack.push(maxPoint)
        continue
    }
    
    var tempStack = Stack()
    
    while(!stack.isEmpty()){
        let peek = stack.peek()!
        
        if(peek == minPoint || peek == maxPoint || (peek > minPoint && peek < maxPoint)){
            print("NO")
            exit(0)
        }
        
        if(peek > minPoint){
            tempStack.push(stack.pop())
        }else{
            break
        }
    }
    
    stack.push(minPoint)
    
    while(!tempStack.isEmpty()){
        
        let peek = tempStack.peek()!
        
        if(peek > maxPoint){
            stack.push(maxPoint)
            break
        }
        stack.push(tempStack.pop())
    }
    
    while(!tempStack.isEmpty()){
        stack.push(tempStack.pop())
    }
}
print("YES")
