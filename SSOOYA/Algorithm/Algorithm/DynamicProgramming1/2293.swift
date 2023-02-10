//
//  2293.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/09.
//
//  백준 2293번 동전 1
//  https://www.acmicpc.net/problem/2293

import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let n = input[0]
let k = input[1]

var price = [Int]()
for _ in 1...n{
    price.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 0, count: k+1)
dp[0] = 1
for i in price{
    var j = i
    while(j <= k){
        let value = dp[j] + dp[j-i]
        dp[j] = value > Int(pow(2.0, 31.0)) ? 0 : value
        j = j+1
    }
}

print(dp.last!)
