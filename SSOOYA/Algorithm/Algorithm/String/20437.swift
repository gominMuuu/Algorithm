//
//  20437.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/20.
//
//  백준 20437번 문자열 게임 2
//  https://www.acmicpc.net/problem/20437

import Foundation

/*
 알파벳 소문자로 이루어진 문자열 W가 주어진다.
 양의 정수 K가 주어진다.
 어떤 문자를 정확히 K개를 포함하는 가장 짧은 연속 문자열의 길이를 구한다.
 어떤 문자를 정확히 K개를 포함하고, 문자열의 첫 번째와 마지막 글자가 해당 문자로 같은 가장 긴 연속 문자열의 길이를 구한다.
 */

let count = Int(readLine()!)!
var result = [String]()
for _ in 1...count{
    
    let input = readLine()!
    let size = Int(readLine()!)!
    
    //Character별 인덱스 값 hash에 저장
    var stringHash = [Character: [Int]]()
    var index = -1
    for i in input{
        index = index + 1
        if(stringHash[i] == nil){
            stringHash[i] = [index]
            continue
        }
        stringHash[i]?.append(index)
    }
    
    let candidate = stringHash.filter({ $0.value.count >= size })
    if(candidate.count == 0){
        result.append("-1")
        continue
    }
    
    var max = 0
    var min = 0
    
    for i in candidate{
        for j in 0...(i.value.count - size){
            let value = candidate[i.key]![j + size - 1] - candidate[i.key]![j] + 1
            if(max < value){
                max = value
            }
            if(min > value || min == 0){
                min = value
            }
        }
    }
    result.append("\(min) \(max)")
}

result.forEach{
    print($0)
}
