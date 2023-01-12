//
//  PriorityQueue.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/10.
//

import Foundation

struct Heap<T: Comparable> {
    
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool // > : 최대
                                             // < : 최소
    
    var isEmpty: Bool {
        return self.elements.count == 1 || self.elements.count == 0
    }
    
    var peek: T? {
        if self.isEmpty { return nil }
        return self.elements[1]
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

/*
struct Heap<T: Comparable>{
    
    private var heap = [T]()
    
    private let sort: (T, T) -> Bool     // > : 최대
                                         // < : 최소
    
    init(sort: @escaping (T,T) -> Bool){
        self.sort = sort
    }
    
    mutating func insert(_ element: T){
        
        if(heap.isEmpty){ //index 기준 1로 잡기 위한 설정
            heap.append(element)
        }
        
        var index = heap.count
        heap.append(element)
        
        while(index != 1 && sort(element, heap[index/2])){
            heap[index] = heap[index/2]
            index = index / 2
        }
        
        heap[index] = element
    }
    
    mutating func remove() -> T{
        
        var parent: Int = 1
        var child: Int = 2
        
        let item = heap[1]
        let temp = heap[size]
    
        
        while(child <= self.size - 1){
            if(child < self.size - 1  && sort(heap[child], heap[child + 1])){
                child = child + 1
            }
            if(!sort(temp, heap[child])){
                break
            }
            
            heap[parent] = heap[child]
            parent = child
            child = child * 2
        }
        
        heap[parent] = temp
        heap.removeLast()
        return item
    }
    
    mutating func clear(){
        heap.removeAll()
    }
    
    func peek() -> T?{
        if(isEmpty()){
            return nil
        }
        return heap.last
    }
    
    var size: Int{
        heap.count - 1
    }
    
    func isEmpty() -> Bool{
        heap.count == 0 || heap.count == 1
    }
}
*/
