//
//  7576.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/07.
//

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
var box = [[Int]]()
var queue = [(Int, Int)]()

for i in 0..<size[1]{
    let row = readLine()!.split(separator: " ").map({ Int($0)! })
    let hasTomamto = row.enumerated().filter{ $0.element == 1 }.map{ $0.offset }
    box.append(row)
    hasTomamto.forEach{
        queue.append((i, $0))
    }
}

//빠른 종료
if(box.allSatisfy{ $0.allSatisfy{ $0 != 0 } }){
    print(0)
    exit(0)
}

/*
 1: 익은 토마토
 0: 익지 않은 토마토
 -1: 없음
 */
var result = 0
while(!queue.isEmpty){
    let element = queue.removeFirst()
    let value = box[element.0][element.1]
    for i in (element.0-1)...(element.0+1){
        if(i < 0 || i >= size[1]){
            continue
        }
        for j in (element.1-1)...(element.1+1){
            let absValidation = abs(element.0 - i) + abs(element.1 - j) > 1
            if(j < 0 || j >= size[0] || (i == element.0 && j == element.1) || box[i][j] == -1 || box[i][j] > 1 || absValidation){
                continue
            }
            box[i][j] = value + 1
            queue.append((i,j))
            result = max(result, value + 1)
        }
    }
}

print(box.allSatisfy{ $0.allSatisfy{ $0 != 0 } } ? result-1 : -1)
