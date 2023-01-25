//
//  2263.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/25.
//
//  백준 2263번 트리의 순회
//  https://www.acmicpc.net/problem/2263

import Foundation

let count = Int(readLine()!)!
let inorder = readLine()!.split(separator: " ").map({ Int($0)! })
let postorder = readLine()!.split(separator: " ").map({ Int($0)! })

func divide(instart: Int, inend: Int, postart: Int, poend: Int){
    
    if(instart == inend){
        preorder.append(inorder[instart])
        return
    }
    
    let middle = postorder[poend]
    let cutIndex = inorder.firstIndex(of: middle)!
    
    preorder.append(middle)
    
    divide(instart: instart, inend: cutIndex - 1, postart: postart, poend: cutIndex - 1)
    divide(instart: cutIndex + 1, inend: inend, postart: cutIndex, poend: poend - 1)
}

var preorder = [Int]()
divide(instart: 0, inend: count - 1, postart: 0, poend: count - 1)

preorder.forEach{
    print($0,terminator: " ")
}
