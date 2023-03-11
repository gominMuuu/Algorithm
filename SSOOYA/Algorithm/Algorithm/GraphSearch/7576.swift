//
//  7576.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/07.
//

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
var box = [[Int]]()
var queue = [(Int, Int)]()

for i in 0..<size[1]{
    var index = 0
    let row: [Int] = readLine()!.split(separator: " ").map{
        let element = Int(String($0))!
        if(element == 1){
            queue.append((i, index))
        }
        index += 1
        return Int($0)!
    }
    box.append(row)
}

func appendQueue(value: Int, i: Int, j: Int){
    if(i < 0 || i >= size[1] || j < 0 || j >= size[0] || box[i][j] > 1 || box[i][j] == -1){
        return
    }
    box[i][j] = value + 1
    queue.append((i, j))
    result = max(result, value + 1)
}

var result = 1
while(!queue.isEmpty){
    
    let element = queue.removeFirst()
    let value = box[element.0][element.1]
    
    appendQueue(value: value, i: element.0 - 1, j: element.1)
    appendQueue(value: value, i: element.0 , j: element.1 - 1)
    appendQueue(value: value, i: element.0, j: element.1 + 1)
    appendQueue(value: value, i: element.0 + 1, j: element.1)
}

print(box.allSatisfy{ $0.allSatisfy{ $0 != 0 } } ? result-1 : -1)
