//
//  20366.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/22.
//
//  백준 20366번 같이 눈사람 만들래?
//  https://www.acmicpc.net/problem/20366

import Foundation

let n = Int(readLine()!)!
let ball = readLine()!.split(separator: " ").map({ Int($0)! })

var result = Int.max

var start = 0
var end = 1

while(start < n-1){
    
    var innerBall = ball
    innerBall.remove(at: end)
    innerBall.remove(at: start)
    
    let standard = ball[start] + ball[end]
    var innerStart = 0
    var innerEnd = 1
    
    while(innerStart < n-3){
        
        result = min(result, abs(standard - innerBall[innerStart] - innerBall[innerEnd]))
        
        innerEnd += 1
        
        if(innerEnd == innerBall.count){
            innerStart += 1
            innerEnd = innerStart + 1
        }
    }
    
    end += 1
    
    if(end == n){
        start += 1
        end = start + 1
    }
}
print(result)
