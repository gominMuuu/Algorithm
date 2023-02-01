//
//  13305_solution.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/31.
//
//  백준 13305번 주유소
//  https://www.acmicpc.net/problem/13305

import Foundation

let cityCount = readLine()!
let roads = readLine()!.split(separator: " ").map({ Int($0)! })
let prices = readLine()!.split(separator: " ").map({ Int($0)! })

var minCost = prices[0]
var result = 0
for i in 0..<roads.endIndex{
    if(prices[i] < minCost){
        minCost = prices[i]
    }
    result = result + minCost * roads[i]
}

print(result)
