//
//  Queue.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/10.
//

import Foundation

struct Queue<T>{
    
    private var data = [T]()
    
    mutating func enqueue(_ element: T){
        data.append(element)
    }
    
    mutating func dequeue() -> T?{
        data.removeFirst()
    }
    
    mutating func clear(){
        data.removeAll()
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
    
    func size() -> Int{
        data.count
    }
}
