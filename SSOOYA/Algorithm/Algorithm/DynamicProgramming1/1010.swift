//
//  1010.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/22.
//

import Foundation

let t = Int(readLine()!)!

var dp = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)
for i in 1...30{
    dp[i][i] = 1
    dp[i][1] = i
}

func getDP(m: Int, n: Int) -> Int{
    if dp[m][n] == 0 {
        dp[m][n] = getDP(m: m-1, n: n-1) + getDP(m: m-1, n: n)
    }
    return dp[m][n]
}

var ans = [Int]()
for _ in 1...t{
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    var (n, m) = (info[0], info[1])
    ans.append(getDP(m: m, n: n))
}

ans.forEach{
    print($0)
}
