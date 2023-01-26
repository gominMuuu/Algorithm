//
//  9934.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/27.
//
//  백준 9934번 완전 이진 트리
//  https://www.acmicpc.net/problem/9934

import Foundation

let k = Int(readLine()!)!
let nodes = readLine()!.split(separator: " ").map({ Int($0)! })

//중위 순회
var result = [String](repeating: "", count: k)

func generateTree(depth: Int, left: Int, right: Int){
    
    if(depth >= k){
        return
    }
    
    let nodeIndex = (left + right) / 2
    let node = nodes[nodeIndex]
    
    generateTree(depth: depth + 1, left: left, right: nodeIndex - 1)
    result[depth].write("\(node) ")
    generateTree(depth: depth + 1, left: nodeIndex + 1, right: right)
}

generateTree(depth: 0, left: 0, right: nodes.endIndex - 1)

for depth in result{
    print(depth.trimmingCharacters(in: .whitespaces))
}
