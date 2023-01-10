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

struct Point{
    let x: Int
    let center: Int
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

let fileIO = FileIO()
let amount = fileIO.readInt()
var storage = [Circle]()
var stack = Stack()

for _ in 0..<amount{
    storage.append(Circle(x: fileIO.readInt(), radius: fileIO.readInt()))
}

for circle in storage{

    let minPoint = circle.x - circle.radius
    let maxPoint = circle.x + circle.radius

    if(stack.isEmpty() || stack.peek()!.x < minPoint){
        stack.push(Point(x: minPoint, center: circle.x))
        stack.push(Point(x: maxPoint, center: circle.x))
        continue
    }
    
    var tempStack = Stack()
    
    while(!stack.isEmpty()){
        let peek = stack.peek()!
        
        
        //반례 -> 특정 원보다 더 큰 원이 들어올 경우
        if(peek.x == minPoint || peek.x == maxPoint){
            print("NO")
            exit(0)
        }else if((peek.x > minPoint && peek.x < maxPoint)){
            //peek의 minpoint보다 minpoint가 작으면 ㄱㅊ
            if(peek.x - 2 * (peek.x - peek.center) < minPoint){
                print("NO")
                exit(0)
            }
        }
        
        if(peek.x < minPoint){
            break
        }
        tempStack.push(stack.pop())
    }
    
    stack.push(Point(x: minPoint, center: circle.x))
    
    while(!tempStack.isEmpty()){
        
        let peek = tempStack.peek()!
        
        if(peek.x > maxPoint){
            break
        }
        stack.push(tempStack.pop())
    }
    
    stack.push(Point(x: maxPoint, center: circle.x))
    
    while(!tempStack.isEmpty()){
        stack.push(tempStack.pop())
    }
}
print("YES")
