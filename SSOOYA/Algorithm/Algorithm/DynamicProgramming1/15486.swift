//
//  15486.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/08.
//
//  백준 15486번 퇴사2
//  https://www.acmicpc.net/problem/15486

import Foundation

let n = Int(readLine()!)!

var necessaryDate = [Int](repeating: 0, count: n+1)
var profit = [Int](repeating: 0, count: n+1)
for i in 1...n{
    let info = readLine()!.split(separator: " ").map({ Int($0)! })
    necessaryDate[i] = info[0]
    profit[i] = info[1]
}

var dp = [Int](repeating: 0, count: n+1)
for i in 1...n{
    //상담 마지막 날 기준으로
    let endDate = i + necessaryDate[i] - 1
    if(endDate == i && dp[i] != 0){
        dp[i] = max(dp[i], profit[i])
    }else if(endDate <= n){
        dp[endDate] = max(dp[endDate], dp[i - 1] + profit[i])
    }
    dp[i] = max(dp[i-1], dp[i])
}
print(dp.last!)
