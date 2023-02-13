//
//  2629.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/13.
//
//  백준 2629번 양팔 저울
//  https://www.acmicpc.net/problem/2629

import Foundation

let weightCount = Int(readLine()!)!
let weights = readLine()!.split(separator: " ").map({ Int($0)! })
let weightTotal = weights.reduce(0, { $0 + $1 })

let marbleCount = Int(readLine()!)!
let marbles = readLine()!.split(separator: " ").map({ Int($0)! })

var result = [String](repeating: "N", count: marbleCount)
func topdown(left: Int, right: Int, index: Int){
    if(left == right){
        result[marbleIndex] = "Y"
        return
    }else if(index >= weightCount || result[marbleIndex] == "Y" || left > weightTotal){
        return
    }
    
    topdown(left: left, right: right, index: index + 1)
    topdown(left: left + weights[index], right: 0, index: index + 1)
    topdown(left: left, right: right + weights[index], index: index + 1)
}

var marbleIndex = 0
for i in marbles{
    //left는 구슬이 있는 저울, right는 구슬이 없는 저울
    topdown(left: i, right: 0, index: 1)
    topdown(left: i + weights[0], right: 0, index: 1)
    topdown(left: i, right: 0 + weights[0], index: 1)
    
    marbleIndex += 1
}

var ans = ""
for i in 0..<marbleCount{
    i != marbleCount - 1 ? ans.write("\(result[i]) ") : ans.write("\(result[i])")
}
print(ans)
