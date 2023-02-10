//
//  9465.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/09.
//
//  백준 9465번 스티커
//  https://www.acmicpc.net/problem/9465

import Foundation

let n = Int(readLine()!)!

var m = 0
var score = [[Int]]()
var result = [Int]()
for _ in 1...n{
    
    score.removeAll()
    m = Int(readLine()!)!
    
    let first = readLine()!.split(separator: " ").map({ Int($0)! })
    let second = readLine()!.split(separator: " ").map({ Int($0)! })
    
    score.append(first)
    score.append(second)
    
    bottomUp()
}

func bottomUp(){
    
    //1행 -> 2행 순으로 진행
    var dp = [[Int]](repeating: Array<Int>(repeating: 0, count: m), count: 2)
    dp[0][0] = score[0][0]
    dp[1][0] = score[1][0]
    
    if(m > 1){
        dp[0][1] = score[1][0] + score[0][1]
        dp[1][1] = score[0][0] + score[1][1]
        //바로 전 대각선과 전전 대각선의 비교 필요
        for j in 2..<m{
            dp[0][j] = score[0][j] + max(dp[1][j-2], dp[1][j-1])
            dp[1][j] = score[1][j] + max(dp[0][j-2], dp[0][j-1])
        }
    }
    
    result.append(max(dp[0].last!, dp[1].last!))
}

result.forEach{
    print($0)
}
