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

var ans = 0
for (id, childs) in links.enumerated(){
    if id != 1 && childs.count == 1 {
        ans += 1
    }
}
print(Double(w) / Double(ans))
