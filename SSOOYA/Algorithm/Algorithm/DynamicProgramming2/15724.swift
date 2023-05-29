//
//  15724.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/29.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (info[0], info[1])

var ground = [[Int]]()
for _ in 1...n{
    let col = readLine()!.split(separator: " ").map{ Int($0)! }
    ground.append(col)
}

var sum = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for i in 0..<n{
    var colSum = 0
    for j in 0..<m{
        colSum += ground[i][j]
        sum[i][j] = colSum
        if i > 0{
            sum[i][j] += sum[i-1][j]
        }
    }
}

let test = Int(readLine()!)!
var ans = [Int]()
for _ in 1...test{
    let testCase = readLine()!.split(separator: " ").map{ Int($0)! - 1 }
    let (lx, ly, rx, ry) = (testCase[0], testCase[1], testCase[2], testCase[3])
    var temp = sum[rx][ry]
    if lx > 0 && ly > 0{
        temp -= sum[lx-1][ry] + sum[rx][ly-1] - sum[lx-1][ly-1]
    } else if lx > 0 {
        temp -= sum[lx-1][ry]
    } else if ly > 0 {
        temp -= sum[rx][ly-1]
    }
    ans.append(temp)
}

ans.forEach{
    print($0)
}
