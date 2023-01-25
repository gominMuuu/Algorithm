//
//  1991.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/24.
//
//  백준 1991번 트리 순회
//  https://www.acmicpc.net/problem/1991

import Foundation

let count = Int(readLine()!)!

var tree = [String](repeating: "A", count: 2)
var nodeIndex = [String:Int]()

for _ in 1...count{
    
    let nodes = readLine()!.split(separator: " ").map({ String($0) })
    
    tree.append(nodes[1])
    tree.append(nodes[2])
    
    nodeIndex[nodes[1]] = tree.count - 2
    nodeIndex[nodes[2]] = tree.count - 1
    
    nodeIndex[nodes[0]] = tree.count - 2
    
}


//전위
func preorder(node: Int){
    if(tree[node] == "."){
        return
    }
    guard let newNode = nodeIndex[tree[node]] else { return }
    print(tree[node], terminator: "")
    preorder(node: newNode)
    preorder(node: newNode + 1)
}
preorder(node: 1)

//중위
func inorder(node: Int){
    if(tree[node] == "."){
        return
    }
    guard let newNode = nodeIndex[tree[node]] else { return }
    inorder(node: newNode)
    print(tree[node], terminator: "")
    inorder(node: newNode + 1)
}
print()
inorder(node: 1)

//후위
func postorder(node: Int){
    if(tree[node] == "."){
        return
    }
    guard let newNode = nodeIndex[tree[node]] else { return }
    postorder(node: newNode)
    postorder(node: newNode + 1)
    print(tree[node], terminator: "")
}
print()
postorder(node: 1)
print()
