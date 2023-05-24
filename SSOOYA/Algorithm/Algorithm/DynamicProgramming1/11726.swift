//
//  11726.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/24.
//

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: max(n+1, 3))
dp[1] = 1
dp[2] = 2

for i in stride(from: 3, to: n+1, by: +1){
    dp[i] = (dp[i-1] + dp[i-2]) % 10007
}

print(dp[n])
