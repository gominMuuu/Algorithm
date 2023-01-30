//
//  1715.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/30.
//
//  백준 1715번 카드 정렬하기
//  https://www.acmicpc.net/problem/1715

import Foundation

let amount = Int(readLine()!)!

var heap = Heap<Int>(sortFunction: <)
for _ in 1...amount{
    let size = Int(readLine()!)!
    heap.insert(node: size)
}

var weight = 0
while(heap.count > 1){
    let first = heap.remove()!
    let second = heap.remove()!
    let comparison = first + second
    heap.insert(node: comparison)
    weight = weight + comparison
}

print(weight)


