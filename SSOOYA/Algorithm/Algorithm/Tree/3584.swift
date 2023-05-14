//
//  3584.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/15.
//

import Foundation

let testCase = Int(readLine()!)!
var ans = [Int]()
for _ in 1...testCase {
    
    let n = Int(readLine()!)!
    var links = [Int](repeating: 0, count: n+1)
    //간선 정보
    for _ in 1..<n{
        let link = readLine()!.split(separator: " ").map{ Int($0)! }
        links[link[1]] = link[0]
    }
    
    let target = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var node = target[0]
    var parents = [Bool](repeating: false, count: n+1)
    while node != 0 {
        parents[node] = true
        node = links[node]
    }
    
    node = target[1]
    while node != 0 {
        if parents[node] {
            ans.append(node); break
        }
        node = links[node]
    }
}

ans.forEach{
    print($0)
}
