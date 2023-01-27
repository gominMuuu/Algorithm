//
//  5639.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/26.
//
//  백준 5639번 이진 검색 트리
//  https://www.acmicpc.net/problem/5639

import Foundation

var tree = [Int]()
var value: Int
while let line = readLine() {
    value = Int(line)!
    tree.append(value)
}

func postOrder(left: Int, right: Int){
    if(left > right){
        return
    }
    if(left == right){
        print(tree[left])
        return
    }
    
    let root = tree[left]
    
    var sliceIndex = right+1
    for i in left+1...right{
        if(tree[i] > root){
            sliceIndex = i
            break
        }
    }
    
    postOrder(left: left + 1, right: sliceIndex - 1)
    postOrder(left: sliceIndex, right: right)
    print(root)
}

postOrder(left: tree.startIndex, right: tree.endIndex - 1)
