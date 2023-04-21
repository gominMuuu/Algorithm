//
//  20440.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/21.
//

import Foundation

let n = Int(readLine()!)!
var enter_exit = Dictionary<Int,Int>()

for _ in 1...n{
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    enter_exit[info[0]] = (enter_exit[info[0]] ?? 0) + 1
    enter_exit[info[1]] = (enter_exit[info[1]] ?? 0) - 1
}

var max_count = -1
var max_time: [Int?] = [nil, nil]

var check = false

var mos = enter_exit.sorted(by: { $0.key < $1.key })
var sum_mos = 0

for time in mos{
    sum_mos += time.value
    if sum_mos > max_count{
        max_count = sum_mos
        max_time[0] = time.key
        check = true
    }else if sum_mos < max_count && check {
        max_time[1] = time.key
        check = false
    }
}
print(max_count)
print(max_time[0]!, max_time[1]!)
