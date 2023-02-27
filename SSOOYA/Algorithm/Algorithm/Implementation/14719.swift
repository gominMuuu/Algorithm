//
//  14719.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/27.
//

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
let blocks = readLine()!.split(separator: " ").map({ Int($0)! })
let n = size[0]
let m = size[1]

var answer = 0
for i in 1..<blocks.count-1{
    
    let leftMax = blocks[0..<i].max()!
    let rightMax = blocks[i+1...blocks.count-1].max()!
    let stn = min(leftMax, rightMax)
    
    if(stn > blocks[i]){
        answer += stn - blocks[i]
    }
}
print(answer)
