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

var numbers = [Int]()
for i in 1...n{
    numbers.append(i)
}

func backtracking(index: Int, count: Int, combination: String){
    if(count == m){
        print(combination); return
    }
    for i in stride(from: 0, to: n, by: +1){
        if(!combination.contains("\(i+1)")){
            backtracking(index: i, count: count + 1, combination: combination + " \(i+1)")
        }
    }
    
}

for i in 0..<n{
    backtracking(index: i, count: 1,combination: "\(i+1)")
}
