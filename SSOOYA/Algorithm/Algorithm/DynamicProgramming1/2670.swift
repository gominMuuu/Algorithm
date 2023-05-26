//
//  2670.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/26.
//

import Foundation

let n = Int(readLine()!)!
var dp = [Double]()
for _ in 1...n{
    dp.append(Double(readLine()!)!)
}
for i in 1..<n{
    dp[i] = max(dp[i-1] * dp[i], dp[i])
}

print(String(format: "%.3f", dp.max()!))
