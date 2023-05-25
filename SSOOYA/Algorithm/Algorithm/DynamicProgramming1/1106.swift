//
//  1106.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/25.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (c, n) = (info[0], info[1])

var dp = [Int](repeating: Int.max/2, count: c+101)
dp[0] = 0

for _ in 1...n{
    let city = readLine()!.split(separator: " ").map{ Int($0)! } //원, 명
    for i in city[1]...c+100{
        dp[i] = min(dp[i], dp[i - city[1]] + city[0])
    }
}

print(dp[c...].min()!)
