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
let size = input[0]
let limit = input[1]

let array = readLine()!.split(separator: " ").map({ Int($0)! })
var elementCount = [Int : [Int]]()

var start = 0
var result = 0
var count = 0

while(start < size){
    
    if(result > size - start + count){
        break
    }

    var end = start
    while(end < size){
        let element = array[end]
        if(elementCount[element] == nil){
            elementCount[element] = [Int]()
        }
        elementCount[element]!.append(end)
        
        if(elementCount[element]!.count > limit){
            break
        }
        count += 1
        end += 1
    }

    result = max(result, count)
    if(end == size){
        break
    }
    
    start = elementCount[array[end]]![1]
    
    let removeIndex = elementCount[array[end]]![0]
    for i in elementCount{
        elementCount[i.key] = i.value.filter{ $0 > removeIndex && $0 < start}
    }
    count = start - removeIndex - 1
}

print(result)
