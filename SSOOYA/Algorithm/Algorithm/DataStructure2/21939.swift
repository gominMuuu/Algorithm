//
//  21939.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/13.
//
//  백준 21939번 문제 추천 시스템 Version 1
//  https://www.acmicpc.net/problem/21939

import Foundation

struct Question: Comparable{
    let index: Int
    let id: Int
    let level: Int
    
    static func < (lhs: Question, rhs: Question) -> Bool {
        return lhs.level != rhs.level ? lhs.level < rhs.level : lhs.id < rhs.id
    }
}

let fileIO = FileIO()
let numberOfQuenstions = fileIO.readInt()

var maxQueue = Heap<Question>(sortFunction: >)
var minQueue = Heap<Question>(sortFunction: <)
var indexManage = [Int: Int]()
var validation = [Bool](repeating: true, count: numberOfQuenstions)

for index in 0..<numberOfQuenstions{
    let id = fileIO.readInt()
    let level = fileIO.readInt()
    let question = Question(index: index, id: id, level: level)
    
    maxQueue.insert(node: question)
    minQueue.insert(node: question)
    indexManage[id] = index
}


let numberOfCommands = fileIO.readInt()
for _ in 1...numberOfCommands{
    let command = fileIO.readString()
    switch command{
        
    case "recommend":
        let level = fileIO.readInt()
        
        if(level == 1){
            while(true){
                let index = maxQueue.peek!.index
                if(validation[index]){
                    break
                }
                _ = maxQueue.remove()
            }
            print(maxQueue.peek!.id)
        }else{ //level == -1
            while(true){
                let index = minQueue.peek!.index
                if(validation[index]){
                    break
                }
                _ = minQueue.remove()
            }
            print(minQueue.peek!.id)
        }
        continue
        
    case "add":
        let id = fileIO.readInt()
        let level = fileIO.readInt()
        let question = Question(index: indexManage.count,id: id, level: level)
        maxQueue.insert(node: question)
        minQueue.insert(node: question)
        indexManage[id] = indexManage.count
        validation.append(true)
        continue
        
    case "solved":
        let id = fileIO.readInt()
        validation[indexManage[id]!] = false
        continue
    
    default:
        continue
    }
}
