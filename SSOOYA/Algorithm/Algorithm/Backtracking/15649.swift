//
//  15649.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/03.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let n = info[0]
let m = info[1]

func backtracking(value: Int, count: Int, combination: String){
    if(count == m){
        print(combination); return
    }
    for i in stride(from: 1, to: n+1, by: +1){
        if(!combination.contains("\(i)")){
            backtracking(value: i, count: count + 1, combination: combination + " \(i)")
        }
    }
    
}

for i in 1...n{
    backtracking(value: i, count: 1,combination: "\(i)")
}
