//
//  6550.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/17.
//
//  백준 6550번 부분 문자열
//  https://www.acmicpc.net/problem/6550

import Foundation

var result = [String]()
inputLoop: while let line = readLine() {
    
    let input = line.split(separator: " ")
    let target = input[0]
    
    var s_index = 0
    var s_char = target[target.index(target.startIndex, offsetBy: s_index)]
    
    for i in input[1]{
        if(s_char == i){
            s_index = s_index + 1
            if(s_index == input[0].count){
                result.append("YES")
                continue inputLoop
            }
            s_char = target[target.index(target.startIndex, offsetBy: s_index)]
        }
    }
    result.append("NO")
}

result.forEach{
    print($0)
}
