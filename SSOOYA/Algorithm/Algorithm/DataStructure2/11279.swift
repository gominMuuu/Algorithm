//
//  11279.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/11.
//
//  백준 11279번 최대 힙
//  https://www.acmicpc.net/problem/11279

import Foundation

let fileIO = FileIO()
let ammount = fileIO.readInt()

var heap = Heap<Int>(sortFunction: >)

for _ in 0..<ammount{
    let input = fileIO.readInt()
    
    switch input{
    case 0:
        if(heap.isEmpty){
            print("0")
            continue
        }
        print(heap.remove()!)
        continue
    default:
        heap.insert(node: input)
        continue
    }
}


