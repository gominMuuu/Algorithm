//
//  1541.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/30.
//
//  백준 1541번 잃어버린 괄호
//  https://www.acmicpc.net/problem/1541

import Foundation

let input = readLine()!.split(separator: "-")

var result = 0
var index = 0
for expr in input{
    let number = expr.split(separator: "+")
    
    var temp = 0
    for i in number{
        temp = temp + Int(i)!
    }
    result = index == 0 ? temp : result - temp
    index = index + 1
}
print(result)
