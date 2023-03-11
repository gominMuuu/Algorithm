//
//  1012.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/10.
//

import Foundation

let test = Int(readLine()!)!

var result = [Int]()
for _ in 1...test{
    
    let info = readLine()!.split(separator: " ").map({ Int($0)! })
    
    var ground = [[Bool]](repeating: [Bool](repeating: false, count: info[1]), count: info[0])
    var cabages = [(Int, Int)]()
    for _ in 1...info[2]{
        let cabbage = readLine()!.split(separator: " ").map({ Int($0)! })
        cabages.append((cabbage[0], cabbage[1]))
        ground[cabbage[0]][cabbage[1]] = true
    }
    
    var count = 0
    var queue = [(Int, Int)]()
    
    func checkValidation(row: Int, col: Int){
        if(row >= 0 && row < info[0] && col >= 0 && col < info[1] && ground[row][col]){
            ground[row][col] = false
            queue.append((row,col))
        }
    }
    for i in cabages{
        if(ground[i.0][i.1]){
            count += 1
            ground[i.0][i.1] = false
            queue.append((i.0,i.1))
        }
        while(!queue.isEmpty){
            let element = queue.removeFirst()
            checkValidation(row: element.0 - 1, col: element.1)
            checkValidation(row: element.0, col: element.1 - 1)
            checkValidation(row: element.0, col: element.1 + 1)
            checkValidation(row: element.0 + 1, col: element.1)
        }
    }
    result.append(count)
}

result.forEach{
    print($0)
}
