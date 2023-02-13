//
//  14567.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/13.
//
//  백준 14567번 선수과목
//  https://www.acmicpc.net/problem/14567

import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
let lecture = input[0]
let prerequisite = input[1]

var semester = [Int: [Int]]() //후속과목이 선수과목 가르킴
for _ in 1...prerequisite{
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    if(semester[input[1]] == nil){
        semester[input[1]] = []
    }
    semester[input[1]]?.append(input[0])
}
let sortedSemester = semester.sorted(by: { $0.key < $1.key })

var result = [Int](repeating: 1, count: lecture+1)
for i in sortedSemester{
    var maxValue = 1
    for j in i.value{
        maxValue = max(result[j], maxValue)
    }
    result[i.key] = maxValue + 1
}

var ans = ""
for i in 1...lecture{
    i != lecture ? ans.write("\(result[i]) ") : ans.write("\(result[i])")
}
print(ans)
