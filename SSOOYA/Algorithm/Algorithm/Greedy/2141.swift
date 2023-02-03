//
//  2141.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/03.
//
//  백준 2141번 우체국
//  https://www.acmicpc.net/problem/2141

import Foundation

let n = Int(readLine()!)!

struct Town{
    let location: Int
    let person: Int
}

var info = [Town]()
for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    info.append(Town(location: input[0], person: input[1]))
}

//1. 사람이 많은 곳
func personStandard(){
    var personStandard = info.sorted(by: { $0.person >  $1.person})
    let max = personStandard.removeFirst()
    
    var sum = 0
    for i in personStandard{
        sum = sum + abs(max.location - i.location) * i.person
    }
    result = (max.location,sum)
}

//2. 중갼에 위치한 곳 > 짝/홀수 구분
func locationStandard(index: Int, data: [Town]){
    var data = data
    let standard = data.remove(at: index)
    
    var sum = 0
    for i in data{
        sum = sum + (standard.location - i.location) * i.person
    }
    if(result.1 > sum){
        result = (standard.location, sum)
    }else if(result.1 == sum && result.0 > standard.location){
        result.0 = standard.location
    }
}

let sortLocation = info.sorted(by: { $0.location >  $1.location})

var result = (0, 0) //town, sum
personStandard()
locationStandard(index: n/2, data: sortLocation)
if(n % 2 == 0){
    locationStandard(index: n/2 - 1, data: sortLocation)
}

print(result.0)
