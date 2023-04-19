//
//  2167.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/19.
//

import Foundation

let size = readLine()!.split(separator: " ").map{ Int($0)! }
let n = size[0]
let m = size[1]

var array = [[Int]]()
for _ in 0..<n{
    let data = readLine()!.split(separator: " ").map{ Int($0)! }
    array.append(data)
}

for j in stride(from: 1, to: m, by: +1){
    array[0][j] = array[0][j-1] + array[0][j]
}

for i in stride(from: 1, to: n, by: +1){
    var rowSum = 0
    for j in 0..<m{
        rowSum += array[i][j]
        array[i][j] = array[i-1][j] + rowSum
    }
}


let k = Int(readLine()!)!
var ans = [Int]()
for _ in 0..<k{
    let info = readLine()!.split(separator: " ").map{ Int($0)! - 1} //i, j , x, y
    let sum = array[info[2]][info[3]] - getValue(i: info[0] - 1, j: info[3]) - getValue(i: info[2], j: info[1] - 1) + getValue(i: info[0] - 1, j: info[1] - 1)
    ans.append(sum)
}

func getValue(i: Int, j: Int) -> Int{
    i < 0 || j < 0 ?  0 : array[i][j]
}

ans.forEach{
    print($0)
}
