//
//  21941.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/16.
//
//  백준 21941번 문자열 제거
//  https://www.acmicpc.net/problem/21941

import Foundation

var string = readLine()!.map({ String($0) })
string.insert("", at: 0)
let n = Int(readLine()!)!

var substring = [[String]](repeating: [String](), count: n+2)
var weight = [Int](repeating: 0, count: n+2)
for i in 1...n{
    let input = readLine()!.split(separator: " ").map({ String($0) })
    substring[i] = input[0].map({ String($0) })
    weight[i] = Int(input[1])!
}

var dp = [Int](repeating: 0, count: string.count+1)
for i in 1...string.count{
    
    dp[i] = max(dp[i], dp[i-1])
    
    if(i == string.count){
        break
    }
    substringLoop: for j in 1...n{
        let sub = substring[j]
        if(i + sub.count <= string.count && sub[0] == string[i]){
            for k in stride(from: 1, to: sub.count, by: -1){
                if(sub[k] != string[i+k]){
                    continue substringLoop
                }
            }
            dp[i + sub.count] = max(dp[i] + weight[j], dp[i + sub.count])
        }
    }
    dp[i] += 1
}
print(dp.last!)
