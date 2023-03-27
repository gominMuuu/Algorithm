//
//  1789.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/27.
//

import Foundation

let n = Int(readLine()!)!

var sum = 0
var num = 0
while(sum < n){
    num += 1
    sum += num
}

sum == n ? print(num) : print(num-1)
