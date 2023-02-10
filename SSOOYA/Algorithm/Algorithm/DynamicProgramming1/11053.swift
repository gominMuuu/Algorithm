//
//  11053.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/10.
//
//  백준 11053번 가장 긴 증가하는 부분 수열
//  https://www.acmicpc.net/problem/11053

import Foundation

let n = Int(readLine()!)!

var number = readLine()!.split(separator: " ").map({ Int($0)! })
number.insert(0, at: 0)

var dp = [Int](repeating: 0, count: n+1)
for i in 1...n{
    
    var j = i-1
    var maxValue = dp[0]
    while(j > 0){
        if(number[j] < number[i]){
            maxValue = max(maxValue, dp[j])
        }
        j = j - 1
    }
    dp[i] = maxValue + 1
}
print(dp.max()!)

/* 반례
 20
 31 84 18 62 35 77 23 53 60 94 3 77 60 51 42 18 83 85 63 51
 */

