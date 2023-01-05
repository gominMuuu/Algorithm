//
//  1918.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/05.
//

import Foundation

struct Priority{
    let priority: Int
    let element: Character
}

typealias Element = Priority
struct Stack{
    private var data = [Element]()
    var result: String = ""
    
    mutating func push(_ element: Element){
        data.append(element)
    }
    
    mutating func pop() -> Element?{
        guard let element = data.last else { return nil }
        if(element.element != "("){
            result.write(String(element.element))
        }
        return data.removeLast()
    }
    
    func peek() -> Element?{
        return data.last
    }
    
    func comparision(_ element: Element) -> Bool{
        guard let last = peek() else {
            return false
        }
        //우선순위에 따른 pop, push 여부 결정
        if(last.element == "("){
            return false
        }
        return last.priority >= element.priority ? true : false
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
}

let input = readLine()!
var stack = Stack()

for char in input{
    
    var element: Element!
    
    switch char{
    case "(":
        element = Priority(priority: 3, element: char)
        stack.push(element)
        continue
    case ")":
        repeat{
            element = stack.pop()
        }while(element.element != "(")
        continue
    case "*", "/":
        element = Priority(priority: 2, element: char)
        break
    case "+", "-":
        element = Priority(priority: 1, element: char)
        break
    default:
        stack.result.write(String(char))
        continue
    }
    
    while (stack.comparision(element)){
        _ = stack.pop()
    }
    stack.push(element)
}

while(!stack.isEmpty()){
    _ = stack.pop()
}

print(stack.result)
