//
//  15961.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation

let io = FileIO()
let (n, d, k, c) = (io.readInt(), io.readInt(), io.readInt(), io.readInt()) //접시의 수 N, 초밥의 가짓수 d, 연속해서 먹는 접시의 수 k, 쿠폰 번호 c

var dishes = [Int](repeating: 0, count: n)
for i in 0..<n{
    dishes[i] = io.readInt()
}

var start = 0, end = k-1
var ans = 0
var count = 1

var eatCount = [Int](repeating: 0, count: 3001)
eatCount[c] = 1

for i in 0..<k{
    let key = dishes[i]
    if eatCount[key] == 0 {
        count += 1
    }
    eatCount[key] += 1
}

repeat {
    
    ans = max(ans, count)
    
    let remove = dishes[start]
    eatCount[remove] -= 1
    if eatCount[remove] == 0 {
        count -= 1
    }
    
    start = (start + 1) % n
    end = (end + 1) % n
    
    let add = dishes[end]
    if eatCount[add] == 0 {
        count += 1
    }
    eatCount[add] += 1
    
} while end != k - 1

print(ans)
