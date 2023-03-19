//
//  1713.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation

let size = Int(readLine()!)!
let n = Int(readLine()!)!
let recommend = readLine()!.split(separator: " ").map{ Int($0)! }

struct Vote{
    let time: Int
    var count: Int
}

var candidates = [Int:Vote]()
for (i, c) in recommend.enumerated(){
    if(candidates[c] != nil){
        candidates[c]!.count += 1
        continue
    }
    
    let vote = Vote(time: i, count: 1)
    if(candidates.count >= size){
        let delete = candidates.min(by: {
            $0.value.count == $1.value.count ? $0.value.time < $1.value.time : $0.value.count < $1.value.count
        })
        candidates.removeValue(forKey: delete!.key)
    }
    candidates[c] = vote
}

print(candidates.sorted(by: { $0.key < $1.key }).reduce(""){ $0 + ("\($1.key) ") })

