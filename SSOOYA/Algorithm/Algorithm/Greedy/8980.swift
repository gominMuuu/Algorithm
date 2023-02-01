//
//  8980.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/01.
//
//  백준 8980번 택배
//  https://www.acmicpc.net/problem/8980

import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let towns = input[0]
let truckSize = input[1]
let boxs = Int(readLine()!)!

var deliverys = [(Int, Int, Int)]()
for _ in 1...boxs{
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    deliverys.append((input[0], input[1], input[2])) //start, end, amount
}

deliverys.sort(by: {
    if($0.1 == $1.1){
        return $0.0 < $1.0
    }
    return $0.1 < $1.1
})

var capacity = [Int](repeating: 0, count: towns)
var result = 0
for i in deliverys{
    
    let max = capacity[i.0..<i.1].max()!
    if(max < truckSize){
        let add = min(i.2, truckSize - max)
        result = result + add
        for i in i.0..<i.1{
            capacity[i] = capacity[i] + add
        }
    }
}

print(result)
