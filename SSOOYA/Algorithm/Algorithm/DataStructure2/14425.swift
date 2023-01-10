//
//  14425.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/10.
//
//  백준 14425번 문자열 집합
//  https://www.acmicpc.net/problem/14425

import Foundation

let input = readLine()!.split(separator: " ").map( { Int($0)! })

var dictionary = [String: Int]() //Dictionary를 HashMap처럼 사용
for i in 1...input[0]{
    let string = readLine()!
    dictionary[string] = i
}

var count = 0
for _ in 1...input[1]{
    let string = readLine()!
    if(dictionary[string] != nil){
        count = count + 1
    }
}

print(count)

