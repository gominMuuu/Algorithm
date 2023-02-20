//
//  20922.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/20.
//
//  백준 20922번 겹치는 건 싫어
//  https://www.acmicpc.net/problem/20922

import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let n = input[0]
let limit = input[1]

let array = readLine()!.split(separator: " ").map({ Int($0)! })
var count = [Int](repeating: 0, count: 100001)

var start = 0
var end = 0
var result = 0

while(start < n){
    if(count[array[start]] != limit){
        count[array[start]] += 1
        start += 1
    }else{
        count[array[end]] -= 1
        end += 1
    }
    result = max(result, start - end)
}

print(result)
