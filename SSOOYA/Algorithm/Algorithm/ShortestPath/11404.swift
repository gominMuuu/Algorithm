//
//  11404.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

//모든 도시에 대한 거리 계산 > 플로이드

var floyd = [[Int]](repeating: [Int](repeating: Int.max/2, count: n), count: n)

for _ in 1...m{
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    floyd[info[0]-1][info[1] - 1] = min(floyd[info[0]-1][info[1] - 1], info[2])
}

for i in 0..<n{
    floyd[i][i] = 0
}

for k in 0..<n{
    for i in 0..<n{
        for j in 0..<n{
            floyd[i][j] = min(floyd[i][j], floyd[i][k] + floyd[k][j])
        }
    }
}

for i in floyd{
    var result = ""
    for j in i{
        j == Int.max/2 ? result.write("0 ") : result.write("\(j) ")
    }
    print(result)
}

