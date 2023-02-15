//
//  21923.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/15.
//
//  백준 21923번 곡예 비행
//  https://www.acmicpc.net/problem/21923

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
let n = size[0]
let m = size[1]

var score = [[Int]](repeating: [Int](repeating: 0, count: 1000), count: 1000)
for i in 0..<n{
    let col = readLine()!.split(separator: " ").map({ Int($0)! })
    var j = 0
    for value in col{
        score[i][j] = value
        j += 1
    }
}

var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -10001, count: 2), count: 1000), count: 100)

func dp1(_ r: Int, _ c: Int, _ up: Int) -> Int{
    
    if( r<0 || c<0 || r>n-1 || c > m-1){
        return -10001
    }
    
    if(dp[r][c][up] != -10001) {
        return dp[r][c][up]
    }

    var value = -10001
    // up
    if(up == 1){
        // 상승
        value = max(value, dp1(r-1,c,up));
        // 오른쪽
        value = max(value, dp1(r,c+1,up));
        // 하강
        value = max(value, dp1(r,c,0));

    }else{
        // 오른쪽
        value = max(value, dp1(r,c+1,up));
        // 하강
        value = max(value, dp1(r+1,c,up));
    }
    dp[r][c][up] = value + score[r][c]
    return dp[r][c][up]

}


dp[n-1][m-1][0] = score[n-1][m-1]
print(dp1(n-1,0,1))
