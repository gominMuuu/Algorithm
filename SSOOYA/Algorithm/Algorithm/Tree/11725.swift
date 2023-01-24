//
//  11725.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/24.
//
//  백준 11725번 트리의 부모 찾기
//  https://www.acmicpc.net/problem/11725

import Foundation

let count = Int(readLine()!)!
var nodeInfo = [Int : [Int]]()
for _ in 2...count{
    let nodes = readLine()!.split(separator: " ").map({ Int($0)! })
    let firstNode = nodes[0]
    let secondNode = nodes[1]
    
    if(nodeInfo[firstNode] == nil){
        nodeInfo[firstNode] = [secondNode]
    }else{
        nodeInfo[firstNode]?.append(secondNode)
    }
    
    if(nodeInfo[secondNode] == nil){
        nodeInfo[secondNode] = [firstNode]
    }else{
        nodeInfo[secondNode]?.append(firstNode)
    }
}


var queue = Queue<Int>()
queue.enqueue(1)
var result = [Int](repeating: 0, count: count + 1) //node의 부모를 담는 자료형

while(!queue.isEmpty()){
    let node = queue.dequeue()!
    for i in nodeInfo[node] ?? [] {
        if(result[i] == 0){
            queue.enqueue(i)
            result[i] = node
        }
    }
}

for i in 2...count{
    print(result[i])
}
