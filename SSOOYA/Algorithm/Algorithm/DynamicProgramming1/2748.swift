//
//  2748.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/06.
//
//  백준 2748번 피보나치 수 2
//  https://www.acmicpc.net/problem/2748

import Foundation

let n = Int(readLine()!)!

func fibo(_ n: Int) -> Int{
    if(storage[n] == -1){
        storage[n] = fibo(n-1) + fibo(n-2)
    }
    return storage[n]
}

var storage = [Int](repeating: -1, count: n+1)
storage[0] = 0
storage[1] = 1

print(fibo(n))
