//
//  3079.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/30.
//

import Foundation

let size = readLine()!.split(separator: " ").map{ Int($0)! }
let m = size[1]
let n = size[0]

var minutes = [Int]()
for _ in 1...n{
    let minute = Int(readLine()!)!
    minutes.append(minute)
}

let minPass = minutes.min()!
var start = minPass
var end = minPass * m
var result = end
while(start <= end){
    let mid = (start + end) / 2
    var count = 0
    for i in 0..<n{
        count += mid / minutes[i]
    }
    if(count < m){
        start = mid + 1
    }else{
        end = mid - 1
        result = min(result, mid)
    }
}
print(result)
