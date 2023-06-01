//
//  12865.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/31.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, k) = (info[0], info[1])

var products = [(0, 0)]
for _ in 1...n{
    let product = readLine()!.split(separator: " ").map{ Int($0)! }
    products.append((product[0], product[1]))
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)
for i in stride(from: 1, to: n+1, by: +1){
    let w = products[i].0
    let v = products[i].1
    for j in stride(from: 1, to: k+1, by: +1){
        if j < w {
            dp[i][j] = dp[i-1][j]
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-w]+v)
        }
    }
}

print(dp[n][k])
