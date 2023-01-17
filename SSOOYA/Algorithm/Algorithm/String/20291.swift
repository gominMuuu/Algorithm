//
//  20291.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/16.
//
//  백준 20291번 파일 정리
//  https://www.acmicpc.net/problem/20291

import Foundation

let size = Int(readLine()!)!

var result = [String : Int]()
for _ in 1...size{
    
    let file = readLine()!.split(separator: ".").map({ String($0) })
    
    if(result[file[1]] == nil){
        result[file[1]] = 1
        continue
    }
    
    result[file[1]] = result[file[1]]! + 1
    
}

result.sorted(by: { $0.key < $1.key }).forEach{ result in
    print(result.key, result.value)
}



