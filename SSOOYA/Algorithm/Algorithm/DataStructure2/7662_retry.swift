//
//  7662_retry.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/10.
//
//  백준 7662번 이중 우선순위 큐
//  https://www.acmicpc.net/problem/7662

import Foundation

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return self.elements.count == 1
    }
    var peek: T? {
        if self.isEmpty { return nil }
        return self.elements.last!
    }
    var count: Int {
        return self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        self.sortFunction = sortFunction
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    func parent(of index: Int) -> Int {
        return (index) / 2
    }
    mutating func add(element: T) {
        self.elements.append(element)
    }
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
            higherPriority = leftIndex
        }
        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
            higherPriority = rightIndex
        }
        if higherPriority != index {
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }
    mutating func swimUp(from index: Int) {
        var index = index
        while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
            self.elements.swapAt(index, self.parent(of: index))
            index = self.parent(of: index)
        }
    }
    mutating func buildHeap() {
        for index in (1...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    mutating func insert(node: T) {
        if self.elements.isEmpty {
            self.elements.append(node)
        }
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    mutating func remove() -> T? {
        if self.isEmpty { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
}

struct Input: Comparable{
    
    let index: Int
    let priority: Int
    
    static func < (lhs: Input, rhs: Input) -> Bool {
        lhs.priority < rhs.priority
    }
}


let fileIO = FileIO()
let testCount = fileIO.readInt()

var result = [[Int]?](repeating: nil, count: testCount)
for i in 0..<testCount{
    
    let operatorAmount = fileIO.readInt()
    
    var maxQueue = Heap<Input>(sortFunction: >)
    var minQueue = Heap<Input>(sortFunction: <)
    var validation = [Bool](repeating: true, count: operatorAmount)
    
    for c in 0..<operatorAmount{
        
        let command = fileIO.readString()
        let valueCommand = fileIO.readInt()
        
        switch command{
        case "D":
            if(valueCommand == 1){
                //최대값 제거
                while(!maxQueue.isEmpty){
                    let remove = maxQueue.remove()!
                    if(validation[remove.index]){
                        validation[remove.index] = false
                        break
                    }
                }
            }else{
                //최소값 제거
                while(!minQueue.isEmpty){
                    let remove = minQueue.remove()!
                    if(validation[remove.index]){
                        validation[remove.index] = false
                        break
                    }
                }
            }
            break
        case "I":
            maxQueue.insert(node: Input(index: c, priority: valueCommand))
            minQueue.insert(node: Input(index: c, priority: valueCommand))
            break
        default:
            continue
        }
    }
    
    var max, min: Int!
    while(!maxQueue.isEmpty){
        let element = maxQueue.remove()!
        if(validation[element.index]){
            max = element.priority
            break
        }
    }
    
    while(!minQueue.isEmpty){
        let element = minQueue.remove()!
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
