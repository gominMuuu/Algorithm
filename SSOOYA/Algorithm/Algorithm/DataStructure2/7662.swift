//
//  7662.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/10.
//
//  백준 7662번 이중 우선순위 큐
//  https://www.acmicpc.net/problem/7662

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

struct Deque<T>{
    
    private var data = [T]()
    
    mutating func insertFirst(_ element: T){
        data.insert(element, at: 0)
    }
    
    mutating func insertLast(_ element: T){
        data.append(element)
    }
    
    mutating func removeFirst() -> T{
        data.removeFirst()
    }
    
    mutating func removeLast() -> T{
        data.removeLast()
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
    
    func size() -> Int{
        data.count
    }
    
    mutating func makeEmpty(){
        data.removeAll()
    }
}

func removeElement(operators: Deque<String>, value: PriorityQueue<Int>) -> PriorityQueue<Int>{
    //command[0] == "I"인 경우
    var operatorQueue = operators
    var valueQueue = value
    
    if(operatorQueue.isEmpty()){
        return valueQueue
    }
    
    if(valueQueue.count <= operatorQueue.size()){
        valueQueue.clear()
        operatorQueue.makeEmpty()
        return valueQueue
    }
    
    var tempDeque = Deque<Int>()
    while(!valueQueue.isEmpty){
        tempDeque.insertFirst(valueQueue.dequeue()!)
    }
    
    while(!operatorQueue.isEmpty()){
        let operation = operatorQueue.removeFirst()
        if(operation == "1"){
            _ = tempDeque.removeLast()
        }else{
            _ = tempDeque.removeFirst()
        }
    }
    
    while(!tempDeque.isEmpty()){
        valueQueue.enqueue(tempDeque.removeFirst())
    }
    
    return valueQueue
}

let fileIO = FileIO()
let testCount = fileIO.readInt()

var result = [[Int]?](repeating: nil, count: testCount)
for i in 0..<testCount{
    
    let operatorAmount = fileIO.readInt()
    
    var operatorQueue = Deque<String>()
    var valueQueue = PriorityQueue<Int>(sort: >) //높은 순
    
    for _ in 1...operatorAmount{
        
        let command = fileIO.readString()
        let valueCommand = fileIO.readInt()
        
        if(command == "D"){
            valueCommand == 1 ? operatorQueue.insertLast("1") : operatorQueue.insertLast("-1")
            continue
        }
        
        if(operatorQueue.isEmpty()){
            valueQueue.enqueue(valueCommand)
            continue
        }
        
        if(valueQueue.count <= operatorQueue.size()){
            valueQueue.clear()
            operatorQueue.makeEmpty()
            valueQueue.enqueue(valueCommand)
            continue
        }
        
        valueQueue = removeElement(operators: operatorQueue, value: valueQueue)
        operatorQueue.makeEmpty()
        valueQueue.enqueue(valueCommand)
    }

    if(operatorQueue.isEmpty()){
        operatorQueue.makeEmpty()
    }else if(valueQueue.count <= operatorQueue.size()){
        valueQueue.clear()
        operatorQueue.makeEmpty()
    }else{
        valueQueue = removeElement(operators: operatorQueue, value: valueQueue)
        operatorQueue.makeEmpty()
    }
    
    if(valueQueue.count != 0){
        let max = valueQueue.peek()!
        var min: Int
        repeat{
            min = valueQueue.dequeue()!
        }while(!valueQueue.isEmpty)
        
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
