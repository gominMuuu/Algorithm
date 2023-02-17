//
//  1915.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/17.
//
//  백준 1915번 가장 큰 정사각형
//  https://www.acmicpc.net/problem/1915

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
let n = size[0]
let m = size[1]

var array = [[Int]]()
for _ in 0..<n{
    let input = readLine()!.map({ Int(String($0))! })
    array.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var result = 0
for i in 0..<n{
    for j in 0..<m{
        
        dp[i][j] = array[i][j]
        
        if(array[i][j] == 0 || j == 0 || i == 0){
            result = max(result, dp[i][j])
            continue
        }
        
        let left = dp[i][j-1]
        let top = dp[i-1][j]
        let cross = dp[i-1][j-1]
        
        if(left != 0 && top != 0 && cross != 0){
            dp[i][j] += (left == top && top == cross) ? dp[i-1][j] : min(dp[i-1][j], dp[i-1][j-1], dp[i][j-1])
            result = max(result, dp[i][j])
        }
    }
}
print(result * result)

/* 반례 케이스
4 4
0100
0111
1111
0011
 
5 5
11100
11110
11111
01111
00111
 */
