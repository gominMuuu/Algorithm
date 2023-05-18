//
//  9489.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/17.
//

import Foundation

var ans = [Int]()
while true {
    
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (n, target) = (input[0], input[1])
    
    if n == 0 && target == 0 {
        ans.forEach{ print($0) }; break
    }
    
    let nodes = readLine()!.split(separator: " ").map{ Int($0)! }
    var child = [[nodes.first!]]
    var index = 1
    while index < nodes.count {
        var end = index + 1
        while end < nodes.count {
            if nodes[end] - nodes[index] == end - index {
                end += 1
            } else {
                break
            }
        }
        child.append(Array(nodes[index..<end]))
        index = end
    }
    
//    var start = 0
//    var end = 0
//    while start < child.count {
//        let childsCount = child[start...end].reduce(0){ $0 + $1.count }
//        if child[start].first! <= target && child[end].last! >= target {
//            for i in start...end{
//                if child[i].contains(target){
//                    ans.append(childsCount - child[i].count); break
//                }
//            }
//            break
//        }
//        start = end + 1
//        end = min(child.count-1, end + childsCount)
//    }
}
