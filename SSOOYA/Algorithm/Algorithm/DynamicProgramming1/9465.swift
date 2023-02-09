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
    var firstDp = [Int](repeating: 0, count: m)
    firstDp[0] = score[0][0]
    for i in 1..<m{
        var value = score[0][i]
        if(i - 2 >= 0){
            value = value + firstDp[i-2] + score[1][i-1]
        }else if(i - 1 == 0){
            value = value + score[1][i-1]
        }
        if(i == m-1){
            value = max(value, firstDp[i-2] + score[1][i])
        }
        firstDp[i] = max(value, firstDp[i-1])
    }
    
    var secondDp = [Int](repeating: 0, count: m)
    secondDp[0] = score[1][0]
    for i in 1..<m{
        var value = score[1][i]
        if(i - 2 >= 0){
            value = value + secondDp[i-2] + score[0][i-1]
        }else if(i - 1 == 0){
            value = value + score[0][i-1]
        }
        if(i == m-1){
            value = max(value, secondDp[i-2] + score[0][i])
        }
        secondDp[i] = max(value, secondDp[i-1])
    }
    
    result.append(max(firstDp.last!, secondDp.last!))
}

result.forEach{
    print($0)
}
