//
//  15650.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/04.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let n = info[0]
let m = info[1]

func backtracking(element: Int, combination: [Int]){
    if(combination.count == m){
        print(combination.reduce(""){ $0 + "\($1) " }); return
    }
    for i in stride(from: element + 1, to: n + 1, by: +1){
        backtracking(element: i, combination: combination + [i])
    }
}

for i in 1...n-m+1{
    backtracking(element: i, combination: [i])
}
