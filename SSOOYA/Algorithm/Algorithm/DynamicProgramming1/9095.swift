//
//  9095.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/07.
//
//  백준 9095번 1,2,3 더하기
//  https://www.acmicpc.net/problem/9095

import Foundation

let n = Int(readLine()!)!

var result = [Int]()
for _ in 1...n{
    
    let test = Int(readLine()!)!
    var count = [0,1,2,4] //기본 값 세팅
    
    if(test < 4){
        result.append(count[test])
        continue
    }
    
    for i in 4...test{
        let newValue = count[i-1] + count[i-2] + count[i-3]
        count.append(newValue)
    }
    
    result.append(count.last!)
}

result.forEach{
    print($0)
}
