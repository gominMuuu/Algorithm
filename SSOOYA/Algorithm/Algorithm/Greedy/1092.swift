//
//  1092.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/01.
//
//  백준 1092번 배
//  https://www.acmicpc.net/problem/1092

import Foundation

let crainAmount = Int(readLine()!)!
var crains = readLine()!.split(separator: " ").map({ Int($0)! })
let boxAmount = Int(readLine()!)!
var boxs = readLine()!.split(separator: " ").map({ Int($0)! })

crains.sort(by: >)
boxs.sort(by: >)

if(boxs.first! > crains.first!){
    print("-1")
    exit(0)
}

var count = 0
while(!boxs.isEmpty){
    for i in crains{
        for j in 0..<boxs.count{
            if(i >= boxs[j]){
                boxs.remove(at: j)
                break
            }
        }
    }
    count = count + 1
}

print(count)
