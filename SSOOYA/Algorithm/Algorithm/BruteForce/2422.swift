//
//  2422.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/17.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
var validation = [[Bool]](repeating: [Bool](repeating: false, count: info[0] + 1), count: info[0] + 1)
for _ in 1...info[1]{
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    validation[input[0]][input[1]] = true
    validation[input[1]][input[0]] = true
}

var result = 0
for i in 1...info[0] - 2{
    for j in i+1...info[0] - 1{
        if(validation[i][j]){
            continue
        }
        for k in j+1...info[0]{
            if(validation[i][k] || validation[j][k]){
                continue
            }
            result += 1
        }
    }
}
print(result)

