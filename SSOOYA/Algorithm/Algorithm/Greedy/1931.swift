//
//  1931.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/02.
//
//  백준 1931번 회의실 배정
//  https://www.acmicpc.net/problem/1931

import Foundation

let n = Int(readLine()!)!

struct Meeting{
    let start: Int
    let end: Int
}

var time = [Meeting]()
for _ in 0..<n{
    let meeting = readLine()!.split(separator: " ").map({ Int($0)! })
    time.append(Meeting(start: meeting[0], end: meeting[1]))
}

time.sort(by: {
    if($0.end == $1.end){
        return $0.start < $1.start
    }
    return $0.end < $1.end
})

var hasMeeting = [(Int, Int)]()
for i in time{
    
    guard let lastMeeting = hasMeeting.last else {
        hasMeeting.append((i.start, i.end))
        continue
    }
    
    if (lastMeeting.1 <= i.start){
        hasMeeting.append((i.start, i.end))
    }
}
print(hasMeeting.count)

