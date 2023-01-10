//
//  7662_retry.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/10.
//

import Foundation

struct Heap<T: Comparable> {

    var nodes: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    mutating func shiftUp(child: Int) {
        var child = child
        var parent = parentIndex(of: child)

        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    mutating func shiftDown(parent: Int) {
        var parent = parent
        
        while true {
            let left = leftChildIndex(of: parent)
            let right = rightChildIndex(of: parent)
            var candidate = parent
            if left < nodes.count && sort(nodes[left], nodes[candidate]) {
                candidate = left
            }
            
            if right < nodes.count && sort(nodes[right], nodes[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func insert(_ data: T) {
        nodes.append(data)
        let lastIndex = nodes.count - 1
        shiftUp(child: lastIndex)
    }
    
    mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        nodes.swapAt(0, nodes.count - 1)
        
        defer { shiftDown(parent: 0) }
        
        return nodes.removeLast()
    }
    
    mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        if index == nodes.count - 1 {
            return nodes.removeLast()
        } else {
            nodes.swapAt(index, nodes.count - 1)
            
            defer {
                shiftUp(child: index)
                shiftDown(parent: index)
            }
            
            return nodes.removeLast()
        }
    }
    
    public func peek() -> T? {
        return nodes.first
    }

    private func parentIndex(of child: Int) -> Int {
        return (child - 1) / 2
    }
    
    private func leftChildIndex(of parent: Int) -> Int {
        return (parent * 2) + 1
    }
    
    private func rightChildIndex(of parent: Int) -> Int {
        return parent * 2
    }
    
    mutating func removeAll(){
        nodes.removeAll()
    }
    
    var isEmpty: Bool{
        nodes.isEmpty
    }
    
    var count: Int{
        nodes.count
    }
}

public struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    public init(sort: @escaping (T, T) -> Bool) {
        heap = Heap(sort: sort)
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public func peek() -> T? {
        return heap.peek()
    }
    
    public mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    public mutating func dequeue() -> T? {
        return heap.remove()
    }
    
    public mutating func clear(){
        heap.removeAll()
    }
}

struct Input: Comparable{
    
    let index: Int
    let priority: Int
    
    static func < (lhs: Input, rhs: Input) -> Bool {
        lhs.priority < rhs.priority
    }
    
//    static func == (lhs: Input, rhs: Input) -> Bool {
//        lhs.priority == rhs.priority && lhs.index == rhs.index
//    }
}


let fileIO = FileIO()
let testCount = fileIO.readInt()

var result = [[Int]?](repeating: nil, count: testCount)
for i in 0..<testCount{
    
    let operatorAmount = fileIO.readInt()
    
    var maxQueue = PriorityQueue<Input>(sort: >)
    var minQueue = PriorityQueue<Input>(sort: <)
    var validation = [Bool](repeating: true, count: operatorAmount)
    
    for c in 0..<operatorAmount{
        
        let command = fileIO.readString()
        let valueCommand = fileIO.readInt()
        
        switch command{
        case "D":

            if(valueCommand == 1){
                //최대값 제거
                while(!maxQueue.isEmpty){
                    let remove = maxQueue.dequeue()!
                    if(validation[remove.index]){
                        validation[remove.index] = false
                        break
                    }
                }
            }else{
                //최소값 제거
                while(!minQueue.isEmpty){
                    let remove = minQueue.dequeue()!
                    if(validation[remove.index]){
                        validation[remove.index] = false
                        break
                    }
                }
            }
            break
        case "I":
            maxQueue.enqueue(Input(index: c, priority: valueCommand))
            minQueue.enqueue(Input(index: c, priority: valueCommand))
            break
        default:
            continue
        }
    }
        
    var max, min: Int!
    while(!maxQueue.isEmpty){
        let element = maxQueue.dequeue()!
        if(validation[element.index]){
            max = element.priority
            break
        }
    }
    
    while(!minQueue.isEmpty){
        let element = minQueue.dequeue()!
        if(validation[element.index]){
            min = element.priority
            break
        }
    }
    
    if(max != nil || min != nil){
        result[i] = [max, min]
    }
}

var index = 0
while(index < testCount){
    
    if(result[index] == nil){
        print("EMPTY")
    }else{
        let value = result[index]!
        print(value[0], value[1])
    }
    index = index + 1
}
