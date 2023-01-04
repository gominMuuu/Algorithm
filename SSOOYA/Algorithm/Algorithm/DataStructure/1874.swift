//
//  1874.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/04.
//

import Foundation

typealias Element = Int

struct Stack{
    private var data = [Element]()
    private var result = [String]()
    
    mutating func push(_ element: Element){
        data.append(element)
        result.append("+")
    }
    
    mutating func pop() -> Element{
        let remove = data.removeLast()
        result.append("-")
        return remove
    }
    
    func peek() -> Element? {
        guard let last = data.last else {
            return nil
        }
        return last
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
    
    mutating func printResult(){
        if(!result.isEmpty){
            result.forEach{
                print($0)
            }
        }else{
            print("NO")
        }
    }
    
    mutating func makeEmpty(){
        result.removeAll()
    }
}

let size = Int(readLine()!)!
var data = [Int](repeating: 0, count: size)

var stack = Stack()
var inputMax: Int = 0

for i in 0..<size{
    data[i] = Int(readLine()!)!
}

for input in data{
    
    let lastElement = stack.peek() ?? 0
    
    if(lastElement == input){
        _ = stack.pop()
    }else if(lastElement < input){
        for element in inputMax+1...input{
            stack.push(element)
        }
        inputMax = input
        _ = stack.pop()
    }else{
        stack.makeEmpty()
        break
    }
}
stack.printResult()
 
