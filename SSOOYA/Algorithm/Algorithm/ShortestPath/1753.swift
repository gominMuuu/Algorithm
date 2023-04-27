//
//  1753.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/27.
//

import Foundation

let size = readLine()!.split(separator: " ").map{ Int($0)! }
let (v, e) = (size[0], size[1])

let start = Int(readLine()!)! - 1

var graph = [[Int]](repeating: [Int](repeating: Int.max/2, count: v), count: v)
for _ in 1...e{
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    graph[info[0] - 1][info[1] - 1] = min(graph[info[0] - 1][info[1] - 1], info[2])
}

var distance = [Int](repeating: Int.max, count: v)

struct Node: Comparable{
    static func < (lhs: Node, rhs: Node) -> Bool {
        if lhs.weight == rhs.weight {
            return lhs.id < rhs.id
        }
        return lhs.weight < rhs.weight
    }
    
    var id: Int
    var weight: Int
}
var heap = Heap<Node>(sortFunction: <)
heap.insert(node: Node(id: start, weight: 0))
distance[start] = 0

while !heap.isEmpty {
    
    let remove = heap.remove()!
    
    if distance[remove.id] < remove.weight {
        continue
    }
    for (i, w) in graph[remove.id].enumerated(){
        let cost = remove.weight + w
        if cost < distance[i] {
            distance[i] = cost
            heap.insert(node: Node(id: i, weight: cost))
        }
    }
}

for i in distance{
    i == Int.max / 2 ? print("INF") : print(i)
}
