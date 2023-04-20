//
//  2015.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/20.
//

import Foundation

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,k) = (t[0],t[1])
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var ans = 0
var pSum = 0    //누적합을 저장할 변수
var sumDict = [Int:Int]()   //key = 누적합 : value = 개수

for i in 0..<n {
    //누적합 계산하기
    pSum += arr[i]
    
    //0~i까지의 누적합이 k라면 + 1
    if pSum == k {
        ans += 1
    }
    
    // pSum - k, pSum 일 경우 ans에 그 값만큼 추가 (pSum - (pSum-k) = k 이므로..)
    if let value = sumDict[pSum - k] {
        ans += value
    }
    
    // sumDict에서 key가 pSum인 값을 += 1
    if let value = sumDict[pSum] {
        sumDict[pSum] = value + 1
    } else {
        sumDict[pSum] = 1
    }
}

print(ans)
