//
//  2503.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/27.
//

import Foundation

let n = Int(readLine()!)!

var questions = [([String], Int, Int)]()
for _ in 1...n{
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    questions.append((String(info[0]).map{ String($0) }, info[1], info[2]))
}

var visit = [Bool](repeating: false, count: 10)
var ans = 0
func find(value: [String]){
    
    if value.count == 3 {
        var dict = [String:Int]()
        for i in value.enumerated() {
            dict[i.element] = i.offset
        }
        for q in questions{
            var count = (0,0) //strike, ball
            let num = q.0.enumerated()
            for i in num{
                guard let offset = dict[i.element] else { continue }
                if offset == i.offset {
                    count.0 += 1
                } else {
                    count.1 += 1
                }
            }
            if !(count.0 == q.1 && count.1 == q.2){ return }
        }
        ans += 1; return
    }
    
    for i in 1...9{
        if !visit[i] {
            visit[i] = true
            find(value: value + [String(i)])
            visit[i] = false
        }
    }
}

find(value: [])
print(ans)
