//
//  2606.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/06.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

//그래프 구성 먼저
var graph = [[Int]](repeating: [Int](), count: n+1)
for _ in 1...m{
    let info = readLine()!.split(separator: " ").map({ Int($0)! })
    graph[info[0]].append(info[1])
    graph[info[1]].append(info[0])
}

//queue
var queue = [Int]()
var validation = [Bool](repeating: true, count: n+1)
var result = 0

//초기 설정
queue.append(1)
validation[1] = false

while(!queue.isEmpty){
    let element = queue.removeFirst()
    graph[element].forEach{
        if(validation[$0]){
            queue.append($0)
            result += 1
            validation[$0] = false
        }
    }
}
print(result)
