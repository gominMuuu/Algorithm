//
//  21758.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/03.
//
//  백준 21758번 꿀 따기
//  https://www.acmicpc.net/problem/21758

import Foundation

let n = Int(readLine()!)!

var total = 0

let places: [Int] = readLine()!.split(separator: " ").map({
    let value = Int($0)!
    total = total + value
    return value
})

func middleHoney(){
    var value = places
    let first = value.removeFirst()
    let last = value.removeLast()
    
    let remove = first + last
    
    value = value.map({
        return total - remove + $0
    })
    result = value.max()!
}

func leftHoney(){
    var value = places
    let first = value.removeFirst()
    value.removeLast()
    
    let standard = total - first
    var temp = total - first
    var rightBee = [Int]()
    var leftBee = [Int]()
    
    for i in value{
        temp = temp - i
        rightBee.append(temp)
        leftBee.append(standard - i)
    }
    
    for i in 0..<value.count{
        let sum = rightBee[i] + leftBee[i]
        result = max(sum, result)
    }
}

func rightHoney(){
    var value = places
    value.removeFirst()
    let last = value.removeLast()
    
    let standard = total - last
    var temp = total - last
    var rightBee = [Int]()
    var leftBee = [Int]()
    
    for i in value.reversed(){
        temp = temp - i
        rightBee.append(temp)
        leftBee.append(standard - i)
    }
    
    for i in 0..<value.count{
        let sum = rightBee[i] + leftBee[i]
        result = max(sum, result)
    }
}

var result = 0

middleHoney()
leftHoney()
rightHoney()

print(result)
