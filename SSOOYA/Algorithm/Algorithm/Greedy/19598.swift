//
//  19598.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/31.
//
//  백준 19598번 최소 회의실 개수
//  https://www.acmicpc.net/problem/19598

import Foundation

let size = Int(readLine()!)!

struct Meeting{
    let id: Int
    let time: Int
    let type: Int //0 -> open / 1 -> close
}

var meetings = [Meeting]()
for i in 0..<size{
    let time = readLine()!.split(separator: " ").map({ Int($0)! })
    meetings.append(Meeting(id: i, time: time[0], type: 0))
    meetings.append(Meeting(id: i, time: time[1], type: 1))
}

meetings.sort(by: {
    if($0.time == $1.time){
        return  $0.type > $1.type
    }
    return $0.time < $1.time
})

var result = 1

for i in 1..<meetings.count{
    if(meetings[i].type == 0){
        if(meetings[i-1].type == 0){
            result = result + 1
            continue
        }
    }
}
print(result)
