//
//  2250.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/27.
//
//  백준 2250번 트리의 높이와 너비
//  https://www.acmicpc.net/problem/2250

import Foundation

let n = Int(readLine()!)!

var nodes = [Int: (Int, Int)]()
var isRoot = [Bool](repeating: true, count: n)
for _ in 1...n{
    let node = readLine()!.split(separator: " ").map({ Int($0)! })
    nodes[node[0]] = (node[1], node[2])
    
    if(node[1] != -1){
        isRoot[node[1] - 1] = false
    }
    if(node[2] != -1){
        isRoot[node[2] - 1] = false
    }
}

var grid = [Int: [Int]]()
var count = 1
//중위 순회로 열 번호 매핑시키기
func inorder(level: Int, node: Int){
    if(node == -1){
        return
    }
    
    guard let child = nodes[node] else { return }
    if(grid[level] == nil){
        grid[level] = []
    }
    
    inorder(level: level + 1, node: child.0)
    grid[level]?.append(count)
    count = count + 1
    inorder(level: level + 1, node: child.1)
}

var root = isRoot.firstIndex(of: true)! + 1
inorder(level: 1, node: root)

//너비 구하기
var result: (Int, Int) = (1,1)
for i in grid{
    //너비 길이 구하기
    let columns = i.value
    let width = columns.last! - columns.first! + 1
    if(result.1 < width){
        result = (i.key, width)
    }else if(result.1 == width && i.key < result.0){
        result.0 = i.key
    }
}
print(result.0, result.1)
