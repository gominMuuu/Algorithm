//
//  1463.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/06.
//
//  백준 1463번 1로 만들기
//  https://www.acmicpc.net/problem/1463

import Foundation

let n = Int(readLine()!)!

var storage = [Int:Int]()
storage[1] = 0

func topdown(_ n: Int) -> Int{
    if(storage[n] == nil){
        var temp = [Int]()
        if(n % 3 == 0){
            temp.append(topdown(n / 3))
        }
        if(n % 2 == 0){
            temp.append(topdown(n / 2))
        }
        if(n - 1 >= 1){
            temp.append(topdown(n-1))
        }
        
        storage[n] = temp.min()! + 1
    }
    
    return storage[n]!
}
print(topdown(n))

var stor = [Int](repeating: 0, count: n+1)
stor[1] = 0
func bottomup(){
    
    if(n == 1){
        print(0)
        exit(0)
    }
    for i in 2...n{
        if(i < 4){
            stor[i] = 1
            continue
        }
        
        stor[i] = stor[i-1] + 1
        if(i % 3 == 0){
            stor[i] = min(stor[i/3] + 1, stor[i])
        }
        if(i % 2 == 0){
            stor[i] = min(stor[i/2] + 1, stor[i])
        }
    }
    print(stor[n])
}

bottomup()
