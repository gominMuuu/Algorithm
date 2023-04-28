//
//  13549.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/28.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, k) = (info[0], info[1]) //수빈, 동생

var queue = [Int]()
var distance = [Int](repeating: Int.max, count: 100002)

distance[n] = 0
queue.append(n)
while !queue.isEmpty {

    let pop = queue.removeFirst()

    if pop * 2 <= 100001 && distance[pop * 2] == Int.max {
        distance[pop * 2] = distance[pop]
        queue.insert(pop * 2, at: 0)
    }
    if pop + 1 <= 100001 && distance[pop + 1] == Int.max{
        distance[pop + 1] = distance[pop] + 1
        queue.append(pop + 1)
    }
    if pop - 1 >= 0 && distance[pop - 1] == Int.max{
        distance[pop - 1] = distance[pop] + 1
        queue.append(pop - 1)
    }
    
    if distance[k] != Int.max {
        break
    }
}


print(distance[k])
