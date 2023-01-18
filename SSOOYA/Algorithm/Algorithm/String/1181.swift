//
//  1181.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/19.
//
//  백준 1181번 단어 정렬
//  https://www.acmicpc.net/problem/1181

import Foundation

let count = Int(readLine()!)!

var words = Set<String>()
for _ in 1...count{
    let word = readLine()!
    words.insert(word)
}

var result = words.sorted()
result = result.sorted(by: { $0.count < $1.count })

result.forEach{
    print($0)
}
