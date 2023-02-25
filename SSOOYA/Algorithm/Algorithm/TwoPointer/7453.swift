//
//  7453.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/23.
//
//  백준 7453번 합이 0인 네 정수
//  https://www.acmicpc.net/problem/7453

import Foundation

let n = Int(readLine()!)!

var array = [[Int]](repeating: [Int](repeating: 0, count: n), count: 4)

(0..<n).map{ col in
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    (0..<4).map{ row in
        array[row][col] = input[row]
    }
}

var minArray = [Int]()
var maxArray = [Int]()
//a-b, c-d
for i in 0..<n{
    for j in 0..<n{
        minArray.append(array[0][i] + array[1][j])
        maxArray.append(array[2][i] + array[3][j])
    }
}

minArray.sort(by: <)
maxArray.sort(by: >)

var start = 0
var end = 0
var result = 0
while(start < minArray.count && end < maxArray.count){
    let value = minArray[start] + maxArray[end]
    if(value > 0){
        end += 1
    }else if(value < 0){
        start += 1
    }else{
        var moveStart = start
        var moveEnd = end
        
        while(moveStart < minArray.count && minArray[moveStart] == minArray[start]){
            moveStart += 1
        }
        
        while(moveEnd < maxArray.count && maxArray[moveEnd] == maxArray[end]){
            moveEnd += 1
        }
        
        result += (moveStart - start) * (moveEnd - end)
        start = moveStart
        end = moveEnd
    }
}

while(start < minArray.count){
    if(minArray[start] + maxArray.last! == 0){
        result += 1
    }
    start += 1
}

while(end < maxArray.count){
    if(minArray.last! + maxArray[end] == 0){
        result += 1
    }
    end += 1
}

print(result)
