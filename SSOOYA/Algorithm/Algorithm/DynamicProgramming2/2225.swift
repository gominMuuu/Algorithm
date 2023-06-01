//
//  2225.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/01.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, k) = (info[0], info[1])

var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: k+1)

for i in 0...n{
    dp[1][i] = 1
}

for i in 1...k{
    for j in 0...n{
        for l in 0...j{
            dp[i][j] = (dp[i][j] + dp[i-1][j-l]) % 1000000000
        }
    }
}

print(dp[k][n])
