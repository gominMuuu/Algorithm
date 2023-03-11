//
//  2667.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/08.
//

import Foundation

let m = Int(readLine()!)!

var apartment = [[Character]]()
var complex = [(Int, Int)]()
for i in 0..<m{
    let input = readLine()!
    apartment.append(Array(input))
    for (j, c) in input.enumerated(){
        if(c == "1"){
            complex.append((i, j))
        }
    }
}

func counting(row: Int, col: Int){
    if(row >= 0 && row < m && col >= 0 && col < m && apartment[row][col] == "1" && validation[row][col] ){
        result[result.count - 1] = result.last! + 1
        validation[row][col] = false
        counting(row: row - 1, col: col)
        counting(row: row, col: col - 1)
        counting(row: row, col: col + 1)
        counting(row: row + 1, col: col)
    }
}

var result = [Int]()
var validation = [[Bool]](repeating: [Bool](repeating: true, count: m), count: m)
for i in complex{
    if(validation[i.0][i.1]){
        result.append(0)
        counting(row: i.0, col: i.1)
    }
}

print(result.count)
result.sorted(by: <).forEach{
    print($0)
}
