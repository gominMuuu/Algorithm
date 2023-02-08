//
//  10844.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/08.
//
//  백준 10844번 쉬운 계단 수
//  https://www.acmicpc.net/problem/10844

import Foundation

let n = Int(readLine()!)!

//한 자리수에 들어갈 수 있는 수 0~9
var dp = [[UInt]](repeating: Array<UInt>(repeating: 0, count: 10), count: n+1)

for i in 1...9{
    dp[1][i] = 1
}

if(n == 1){
    print(9)
    exit(0)
}

for i in 2...n{
    for j in 0...9{
        if(j == 0){
            dp[i][0] = dp[i-1][1]
        }else if(j == 9){
            dp[i][9] = dp[i-1][8]
        }else {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
        }
    }
}

var result: UInt = 0
for i in 0...9{
    result = (result + dp[n][i]) % 1000000000
}
print(result)
