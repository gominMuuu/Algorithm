//
//  Stack.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/10.
//

import Foundation


struct Stack<T>{
    
    private var data = [T]()
    
    mutating func push(_ element: T){
        data.append(element)
    }
    
    mutating func pop() -> T{
        data.removeLast()
    }
    
    mutating func clear(){
        data.removeAll()
    }
    
    func peek() -> T?{
        data.last
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
    
    func size() -> Int{
        data.count
    }
}

