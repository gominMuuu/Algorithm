//
//  5557.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/02.
//

import Foundation

let n = Int(readLine()!)!
let nodes = readLine()!.split(separator: " ").map{ Int($0)! }

var dp = [[Int]](repeating: [Int](repeating: 0, count: 21), count: n)
dp[1][nodes[0]] = 1

for i in 2..<n{
    for j in 0...20{
        if j + nodes[i-1] <= 20{
            dp[i][j+nodes[i-1]] += dp[i-1][j]
        }
        if j - nodes[i-1] >= 0{
            dp[i][j-nodes[i-1]] += dp[i-1][j]
        }
    }
}

print(dp[n-1][nodes.last!])
