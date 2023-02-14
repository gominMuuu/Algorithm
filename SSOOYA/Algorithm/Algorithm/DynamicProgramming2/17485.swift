//
//  17485.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/14.
//
//  백준 17485번 진우의 달 여행 (Large)
//  https://www.acmicpc.net/problem/17485

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
let m = size[0]
let n = size[1]
var matrix = [[Int]](repeating: [Int](repeating: 0, count: 1000), count: 1000)

for i in 0..<m{
    let col = readLine()!.split(separator: " ").map({ Int($0)! })
    for j in 0..<n{
        matrix[i][j] = col[j]
    }
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 1000), count: 1000)
for i in 0..<n{
    dp[0][i] = matrix[0][i]
}

for i in 0..<n{
    if(i == 0){
        dp[1][i] = min(matrix[0][i], matrix[0][i+1])
    }else if(i == n-1){
        dp[1][i] = min(matrix[0][i], matrix[0][i-1])
    }else{
        dp[1][i] = min(matrix[0][i], matrix[0][i+1], matrix[0][i-1])
    }
    dp[1][i] += matrix[1][i]
}

for i in 2..<m{
    for j in 0..<n{
        if(j == 0){
            let minDp = min(dp[i-2][j], dp[i-2][j+1])
            dp[i][j] = min(matrix[i-1][j] + dp[i-2][j+1], matrix[i-1][j+1] + minDp) + matrix[i][j]
        }else if(j == n-1){
            let minDp = min(dp[i-2][j], dp[i-2][j-1])
            dp[i][j] = min(matrix[i-1][j] + dp[i-2][j-1], matrix[i-1][j-1] + minDp) + matrix[i][j]
        }else{
            let firstDp = min(dp[i-2][j], dp[i-2][j-1])
            let secondDp = min(dp[i-2][j-1], dp[i-2][j+1])
            let thridDp = min(dp[i-2][j], dp[i-2][j+1])
            dp[i][j] = min(matrix[i-1][j-1] + firstDp, matrix[i-1][j] + secondDp, matrix[i-1][j+1] + thridDp) + matrix[i][j]
            print(dp[i][j], firstDp, secondDp, thridDp)
        }
    }
}

print(dp[m-1][0...n-1].min()!)
