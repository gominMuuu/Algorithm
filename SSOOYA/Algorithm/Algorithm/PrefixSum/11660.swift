//
//  11660.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/17.
//

import Foundation

let size = readLine()!.split(separator: " ").map{ Int($0)! }
let n = size[0]
let m = size[1]

var coordinate = [[Int]]()
for _ in 1...n{
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    coordinate.append(info)
}

typealias SumCoordinate = (x1: Int, y1: Int, x2: Int, y2: Int)
var findSum = [(SumCoordinate)]()
for _ in 1...m{
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let coord: SumCoordinate = (input[0], input[1], input[2], input[3])
    findSum.append(coord)
}

var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
for i in 1...n{
    var rowSum = 0
    for j in 1...n{
        rowSum += coordinate[i-1][j-1]
        prefixSum[i][j] = prefixSum[i-1][j] + rowSum
    }
}

var result = [Int]()
for coord in findSum{
    let sum = prefixSum[coord.x2][coord.y2] - prefixSum[coord.x1-1][coord.y2] - prefixSum[coord.x2][coord.y1-1] + prefixSum[coord.x1-1][coord.y1-1]
    result.append(sum)
    
}

result.forEach{
    print($0)
}
