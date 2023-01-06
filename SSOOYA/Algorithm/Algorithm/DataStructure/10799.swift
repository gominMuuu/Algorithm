//
//  10799.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/06.
//
//  백준 10799번
//  https://www.acmicpc.net/problem/10799

import Foundation

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
}

let input = readLine()!

var stack = Stack()
var index: Int = 0
var result = 0

for element in input{
    
    if(element == "("){
        stack.push(index)
    }else{
        let openIndex = stack.pop()
        result = index - openIndex == 1 ? result + stack.size() : result + 1
    }
    
    index = index + 1
}
print(result)
