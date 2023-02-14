//
//  2228.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/14.
//

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
let n = size[0]
let m = size[1]

var include = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
var notInclude = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)

for i in 1...n{
    let input = Int(readLine()!)!
    let min = min(m, (i+1) / 2)
    for j in 1...min{
        notInclude[i][j] = max(include[i-1][j], notInclude[i-1][j])
        include[i][j] = max(include[i-1][j], notInclude[i-1][j-1]) + input
    }
}
print(max(include[n][m], notInclude[n][m]))
                          

