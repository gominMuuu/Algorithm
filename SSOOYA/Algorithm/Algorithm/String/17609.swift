//
//  17609.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/18.
//
//  백준 17609번 회문
//  https://www.acmicpc.net/problem/17609

import Foundation

let fileIO = FileIO()
let count = fileIO.readInt()

func checkWithRemoveCharacter(_ input: [Character], _ start: Int) -> Bool{
    
    let lastIndex = input.count - 1
    let loopIndex = input.count % 2 == 0 ? lastIndex / 2 : lastIndex / 2 - 1
    
    for i in start...loopIndex{
        
        let left = input[i]
        let right = input[lastIndex - i]
        
        if(left != right){
            return false
        }
    }
    
    return true
}

inputLoop: for _ in 1...count{
    
    let input = fileIO.readString().map({ $0 })
    
    let lastIndex = input.count - 1
    let loopIndex = input.count % 2 == 0 ? lastIndex / 2 : lastIndex / 2 - 1
    
    //1. 회문 검사
    for i in 0...loopIndex{
        
        let left = input[i]
        let right = input[lastIndex - i]
        
        if(left != right){
            var leftRemove = input
            leftRemove.remove(at: i)
            
            var rightRemove = input
            rightRemove.remove(at: lastIndex - i)
            
            checkWithRemoveCharacter(leftRemove, i) || checkWithRemoveCharacter(rightRemove, i) ? print("1") : print("2")
            continue inputLoop
        }
    }
    print("0")
}
