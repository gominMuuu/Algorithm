//
//  2231.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/26.
//

import Foundation

let n = Int(readLine()!)!

var ans = Int.max

func divideSum(_ num: Int, sum: Int){
    
    if num >= n {
        return
    } else if num + sum == n {
        ans = min(ans, num); return
    }
    
    for i in 0...9{
        divideSum(num * 10 + i, sum: sum + i)
    }
}

for i in 1...9{
    divideSum(i, sum: i)
}

print(ans == Int.max ? 0 : ans)
