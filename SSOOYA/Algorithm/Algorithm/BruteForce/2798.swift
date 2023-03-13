//
//  2798.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/13.
//

import Foundation

let info = readLine()!.split(separator: " ").map({ Int($0)! })
let cards = readLine()!.split(separator: " ").map({ Int($0)! })

struct Sum{
    let id1: Int
    let id2: Int
    let sum: Int
}

var twoSum = [Sum]()
for i in 0..<info[0]{
    for j in i+1..<info[0]{
        twoSum.append(Sum(id1: i, id2: j, sum: cards[i] + cards[j]))
    }
}

var result = 0
for i in twoSum{
    for j in 0..<cards.count{
        if(i.id1 == j || i.id2 == j){
            continue
        }
        if(i.sum + cards[j] == info[1]){
            print(info[1])
            exit(0)
        }else if(i.sum + cards[j] < info[1]){
            result = max(result, i.sum + cards[j])
        }
    }
}
print(result)
