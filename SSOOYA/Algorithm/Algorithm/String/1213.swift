//
//  1213.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/12.
//

import Foundation

let name = readLine()!

var map = [Character:Int]()
for i in name{
    map[i] = map[i] == nil ? 1 : map[i]! + 1
}

var ans = ""
var mid: Character? = nil
for (key, value) in map.sorted(by: { $0.key < $1.key }){
    
    ans = ans + String(repeating: key, count: value / 2)
    
    if value % 2 != 0 {
        if mid == nil {
            mid = key
        } else {
            print("I'm Sorry Hansoo"); exit(0)
        }
    }
}

mid == nil ? print(ans + ans.reversed()) : print(ans + String(mid!) + ans.reversed())
