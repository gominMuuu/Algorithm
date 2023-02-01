//
//  13305.swift
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

let total = roads.reduce(0, { $0 + $1 })

var result: Int = -1
func calculate(total: Int, remainLength: Int, start: Int){
    if (remainLength == 0){
        if(result > total || result == -1){
            result = total
        }
        return
    }
    
    var fuel = 0
    var price = 0
    for i in start..<roads.endIndex{
        fuel = fuel + roads[i]
        price = price + roads[i] * prices[start]
        calculate(total: total + price, remainLength: remainLength - fuel, start: i + 1)
    }
}

calculate(total: 0, remainLength: total, start: 0)
print(result)
