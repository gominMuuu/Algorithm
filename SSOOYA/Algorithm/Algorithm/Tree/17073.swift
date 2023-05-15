//
//  17073.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/16.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, w) = (info[0], info[1])

var links = [[Int]](repeating: [Int](), count: n+1)
for _ in 1..<n{
    let link = readLine()!.split(separator: " ").map{ Int($0)! }
    links[link[0]].append(link[1])
    links[link[1]].append(link[0])
}

var visit = [Bool](repeating: false, count: n+1)
var waterAmount = [Int]()
func fallDown(node: Int, water: Int){
    visit[node] = true
    let child = links[node].filter{ !visit[$0] }
    if child.isEmpty {
        waterAmount.append(water)
    } else {
        let perAmount = water / child.count
        for (index, id) in child.enumerated(){
            if index != 0 && index == child.count - 1 {
                fallDown(node: id, water: water - (child.count - 1) * perAmount)
            } else {
                fallDown(node: id, water: perAmount)
            }
        }
    }
}

fallDown(node: 1, water: w)
print(Double(w) / Double(waterAmount.count))
