//
//  2579.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/07.
//
//  백준 2579번 계단 오르기
//  https://www.acmicpc.net/problem/2579

import Foundation

let n = Int(readLine()!)!

var scores = [Int](repeating: 0, count: 300)
for i in 0..<n{
    let score = Int(readLine()!)!
    scores[i] = score
}

var total = [Int](repeating: 0, count: 300)
total[0] = scores[0]
total[1] = max(scores[0] + scores[1],scores[1])
total[2] = max(scores[1] + scores[2], scores[0] + scores[2])

if(n >= 3){
    for i in 3..<n{
        total[i] = max(total[i-2] + scores[i], scores[i-1] + scores[i] + total[i-3])
    }
}
print(total[n-1])
