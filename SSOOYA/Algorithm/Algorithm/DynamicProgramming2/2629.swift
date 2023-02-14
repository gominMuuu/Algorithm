//
//  2629.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/13.
//
//  백준 2629번 양팔 저울
//  https://www.acmicpc.net/problem/2629

import Foundation

let w = Int(readLine()!)!
var weights = readLine()!.split(separator: " ").map({ Int($0)! })
weights.append(0)

let m = Int(readLine()!)!
let marbles = readLine()!.split(separator: " ").map({ Int($0)! })


var dp = [[Bool]](repeating: [Bool](repeating: false, count: 31), count: 30 * 500 + 1)
func topdown(i: Int, value: Int){
    if(i > w || dp[i][value]){
        return
    }
    dp[i][value] = true
    topdown(i: i+1, value: value)
    topdown(i: i+1, value: value + weights[i])
    topdown(i: i+1, value: abs(value - weights[i]))
}

topdown(i: 0, value: 0)

var result = ""
for i in marbles{
    if(i > 30 * 50){
        result.write("N ")
    }else if(dp[w][i]){
        result.write("Y ")
    }else{
        result.write("N ")
    }
}
print(result.trimmingCharacters(in: .whitespaces))
