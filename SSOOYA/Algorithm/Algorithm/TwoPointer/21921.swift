//
//  21921.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/21.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)!}
let (n, k) = (info[0], info[1])

let nodes = readLine()!.split(separator: " ").map{ Int($0)!}

var left = 0, right = left + k - 1
var ans: (sum: Int, count: Int) = (0,0)
var temp: Int = nodes[left...right].reduce(0){ $0 + $1 }

while true {
    if right - left == k{ //간격 k보다 큰 경우
        temp -= nodes[left]
        left += 1
    } else { //간격 k인 경우
        if temp > ans.sum {
            ans = (temp, 1)
        } else if temp == ans.sum {
            ans.count += 1
        }
        right += 1
        if right >= n{
            break
        }
        temp += nodes[right]
    }
}

if ans.sum == 0 {
    print("SAD")
} else {
    print(ans.sum)
    print(ans.count)
}
