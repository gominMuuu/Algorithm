//
//  1764.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/16.
//
//  백준 1764번 파일 정리
//  https://www.acmicpc.net/problem/1764

import Foundation

let fileIO = FileIO()
let seeCount = fileIO.readInt()
let hearCount = fileIO.readInt()

var notSee = [String: Int]()
for _ in 1...seeCount{
    let player = fileIO.readString()
    notSee[player] = 0
}

var result = [String]()
for _ in 1...hearCount{
    let player = fileIO.readString()
    if(notSee[player] != nil){
        result.append(player)
    }
}

print(result.count)
result.sorted().forEach{
    print($0)
}
