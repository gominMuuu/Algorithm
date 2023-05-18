//
//  1068.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/18.
//

import Foundation

let n = Int(readLine()!)!
let nodes = readLine()!.split(separator: " ").map{ Int($0)! }
let target = Int(readLine()!)!

var tree = [Int: [Int]]()
var bfs = [Int]()
for (id, parent) in nodes.enumerated(){
    if id == target{
        continue
    } else if parent == -1 {
        bfs = [id]
    }
    tree[parent] = tree[parent] == nil ? [id] : tree[parent]! + [id]
}

if bfs.isEmpty {
    print(0); exit(0)
}

var ans = 0
while !bfs.isEmpty {
    let parent = bfs.removeFirst()
    guard let child = tree[parent] else { ans += 1; continue }
    for i in child{
        bfs.append(i)
    }
}
print(ans)
