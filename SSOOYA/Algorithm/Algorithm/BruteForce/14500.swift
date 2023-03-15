//
//  14500.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/15.
//

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
let n = size[0]
let m = size[1]

var board = [[Int]]()

for _ in 1...n{
    let row = readLine()!.split(separator: " ").map({ Int($0)! })
    board.append(row)
}

var ans = 0
func circuit(coordinate: (Int,Int), visited: [(Int, Int)]){
    if(coordinate.0 < 0 || coordinate.0 >= n || coordinate.1 < 0 || coordinate.1 >= m || visited.contains(where: { $0.0 == coordinate.0 && $0.1 == coordinate.1 })){
        return
    }
    
    var visited = visited
    visited.append(coordinate)
    if(visited.count == 4){
        let sum = visited.reduce(0){ $0 + board[$1.0][$1.1] }
        ans = max(sum, ans)
        return
    }
    
    circuit(coordinate: (coordinate.0 - 1, coordinate.1), visited: visited)
    circuit(coordinate: (coordinate.0, coordinate.1 - 1), visited: visited)
    circuit(coordinate: (coordinate.0, coordinate.1 + 1), visited: visited)
    circuit(coordinate: (coordinate.0 + 1, coordinate.1), visited: visited)
    
    if(visited.count == 3){
        let row = visited.first!.0
        let col = visited.first!.1
        let middle = visited[1]
        if(visited.allSatisfy{ $0.0 == row}){
            circuit(coordinate: (row - 1, middle.1), visited: visited)
            circuit(coordinate: (row + 1, middle.1), visited: visited)
        }else if(visited.allSatisfy{ $0.1 == col }){
            circuit(coordinate: (middle.0, col - 1), visited: visited)
            circuit(coordinate: (middle.0, col + 1), visited: visited)
        }
    }
}

for i in 0..<n{
    for j in 0..<m{
        circuit(coordinate: (i,j), visited: [])
    }
}

print(ans)
