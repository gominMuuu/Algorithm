//
//  1806.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/23.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, s) = (info[0], info[1])
let nodes = readLine()!.split(separator: " ").map{ Int($0)! }

var left = 0, right = 0
var sum = nodes.first!
var ans = Int.max

func moveRight() -> Bool{
    right += 1
    if right == nodes.count { return false }
    sum += nodes[right]
    return true
}

func moveLeft(){
    sum -= nodes[left]
    left += 1
}

func renew(){
    ans = min(ans, right - left + 1)
}

while left <= right{
    if sum < s {
        if !moveRight() {
            break
        }
    } else if sum > s {
        renew()
        moveLeft()
    } else {
        renew()
        if !moveRight() {
            break
        }
    }
}

if sum >= s {
    ans = min(ans, right - left)
} else if ans == Int.max {
    ans = 0
}
print(ans)

