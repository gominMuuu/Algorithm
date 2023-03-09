//
//  14940.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/09.
//

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })

var spot = [[Int]]()
var goal: (Int, Int) = (-1, -1)
var canReach = [(Int, Int)]()
for i in 0..<size[0]{
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    spot.append(input)
    if(goal == (-1, -1) && input.contains(2)){
        goal = (i, input.firstIndex(of: 2)!)
    }
    canReach.append(contentsOf: input.enumerated().filter{ $0.element == 1 }.map{ (i, $0.offset) })
}

var queue = [goal]
var validation = [[Bool]](repeating: [Bool](repeating: false, count: size[1]), count: size[0])
func isValidation(value: Int, row: Int, col: Int){
    if(row >= 0 && row < size[0] && col >= 0 && col < size[1] && !validation[row][col] && spot[row][col] == 1){
        spot[row][col] = value
        queue.append((row, col))
        validation[row][col] = true
    }
}

spot[goal.0][goal.1] = 0
validation[goal.0][goal.1] = true
while(!queue.isEmpty){
    let pop = queue.removeFirst()
    let value = spot[pop.0][pop.1]
    isValidation(value: value + 1, row: pop.0 - 1, col: pop.1)
    isValidation(value: value + 1, row: pop.0, col: pop.1 - 1)
    isValidation(value: value + 1, row: pop.0, col: pop.1 + 1)
    isValidation(value: value + 1, row: pop.0 + 1, col: pop.1)
}

for (i,j) in canReach{
    if(!validation[i][j]){
        spot[i][j] = -1
    }
}

spot.forEach{ row in
    var line = ""
    row.forEach{
        line.write("\($0) ")
    }
    print(line)
}

