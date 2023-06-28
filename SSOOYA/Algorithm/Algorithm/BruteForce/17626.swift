//
//  17626.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/28.
//

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 50001)

for i in 1...n{
    dp[i] = dp[i-1] + 1
    for j in 1...Int(sqrt(Float(i))){
        dp[i] = min(dp[i], dp[i-j*j] + 1)
    }
}

print(dp[n])
