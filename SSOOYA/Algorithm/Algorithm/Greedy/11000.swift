//
//  11000.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/02.
//
//  백준 11000번 강의실 배정
//  https://www.acmicpc.net/problem/11000

import Foundation

let n = Int(readLine()!)!

struct Lecture{
    let id: Int
    let time: Int
    let type: Int
}

var time = [Lecture]()
var validation = [Bool](repeating: false, count: n)
for i in 0..<n{
    let meeting = readLine()!.split(separator: " ").map({ Int($0)! })
    time.append(Lecture(id: i, time: meeting[0], type: 0))
    time.append(Lecture(id: i, time: meeting[1], type: 1))
}

time.sort(by: {
    if($0.time == $1.time){
        return $0.type > $1.type ? true : false
    }
    return $0.time < $1.time
})

var count = 0 //현재 사용 중인 강의실 개수
var max = 0 //최대로 강의실이 많이 열린 경우 저장하는 프로퍼티

for i in time{
    if(validation[i.id]){
        validation[i.id] = false
        count = count - 1
    }else{
        validation[i.id] = true
        count = count + 1
        if(count > max){
            max = count
        }
    }
}
print(max)
/*
 3
 999999999 1000000000
 999999998 999999999
 1 999999998
 */
