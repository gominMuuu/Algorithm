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

var necessaryDate = [Int](repeating: 0, count: n+2)
var profit = [Int](repeating: 0, count: n+2)
for i in 1...n{
    let info = readLine()!.split(separator: " ").map({ Int($0)! })
    necessaryDate[i] = info[0]
    profit[i] = info[1]
}

var dp = [Int](repeating: 0, count: n+2)
var result = 0

//일을 마치는 당일을 기준으로 하니까 조건이 많아져서 코드가 복잡해짐
//일을 마친 다음 날을 기준으로 설정하니까 위의 문제 해결
for i in 1...n+1{
    
    result = max(result, dp[i])
    
    let endDate = i + necessaryDate[i]
    if(endDate > n + 1){
        continue
    }
    
    dp[endDate] = max(result + profit[i], dp[endDate])
}
print(result)
