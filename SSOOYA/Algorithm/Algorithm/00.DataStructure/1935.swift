//
//  1935.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/02.
//

import Foundation

typealias Element = Double //Float형일 경우 틀린 답. 데이터 크기 조심!

struct Stack{
    var data: [Element] = []
    var top: Int = -1
    
    mutating func push(new: Element){
        self.top = self.top + 1
        self.data.insert(new, at: top)
    }
    
    mutating func pop() -> Element{
        let popElement = self.data[self.top]
        self.top = self.top - 1
        return popElement
    }
}

let size = Int(readLine()!)!
let expression = readLine()!

var stack = Stack()

var mapping: [Character:Element] = [:]
for i in 0..<size{
    mapping[Character(UnicodeScalar(65+i)!)] = Element(readLine()!)!
}

expression.forEach{ char in
    let result: Element!
    switch char{
    case "*":
        result = stack.pop() * stack.pop()
        break
    case "/":
        let right = stack.pop()
        result = stack.pop() / right
        break
    case "+":
        result = stack.pop() + stack.pop()
        break
    case "-":
        let right = stack.pop()
        result = stack.pop() - right
        break
    default:
        result = mapping[char]
    }
    stack.push(new: result)
}

print(String(format: "%.2f", stack.pop()))

