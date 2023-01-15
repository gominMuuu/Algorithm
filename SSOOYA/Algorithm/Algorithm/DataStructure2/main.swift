//
//  21944.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/13.
//
//  백준 21944번 문제 추천 시스템 Version 2
//  https://www.acmicpc.net/problem/21944

import Foundation

struct Question: Comparable{
    let index: Int
    let id: Int
    let level: Int
    let category: Int
    
    static func < (lhs: Question, rhs: Question) -> Bool {
        return lhs.level != rhs.level ? lhs.level < rhs.level : lhs.id < rhs.id
    }
}

let fileIO = FileIO()

var maxQueue = Heap<Question>(sortFunction: >)
var minQueue = Heap<Question>(sortFunction: <)

var levelHashIndex = [Int](repeating: -1, count: 101)
var maxLevelHash = [Heap<Question>(sortFunction: >)]
var minLevelHash = [Heap<Question>(sortFunction: <)]

var categoryHashIndex = [Int](repeating: -1, count: 101)
var maxCategoryHash = [Heap<Question>(sortFunction: >)]
var minCategoryHash = [Heap<Question>(sortFunction: <)]

var questionIndexManage = [Int:Int]()

let numberOfQuestions = fileIO.readInt()
var validation = [Bool](repeating: true, count: numberOfQuestions)
for index in 0..<numberOfQuestions{
    let id = fileIO.readInt()
    let level = fileIO.readInt()
    let category = fileIO.readInt()
    
    let question = Question(index: index, id: id, level: level, category: category)
    
    maxQueue.insert(node: question)
    minQueue.insert(node: question)
    
    questionIndexManage[id] = index
    
    if(levelHashIndex[level] == -1){
        levelHashIndex[level] = maxLevelHash.count
        
        var maxHeap = Heap<Question>(sortFunction: >)
        maxHeap.insert(node: question)
        var minHeap = Heap<Question>(sortFunction: <)
        minHeap.insert(node: question)
        
        maxLevelHash.append(maxHeap)
        minLevelHash.append(minHeap)
    }else{
        maxLevelHash[levelHashIndex[level]].insert(node: question)
        minLevelHash[levelHashIndex[level]].insert(node: question)
    }
    
    if(categoryHashIndex[category] == -1){
        categoryHashIndex[category] = maxCategoryHash.count
        
        var maxHeap = Heap<Question>(sortFunction: >)
        maxHeap.insert(node: question)
        var minHeap = Heap<Question>(sortFunction: <)
        minHeap.insert(node: question)
        
        maxCategoryHash.append(maxHeap)
        minCategoryHash.append(minHeap)
    }else{
        maxCategoryHash[categoryHashIndex[category]].insert(node: question)
        minCategoryHash[categoryHashIndex[category]].insert(node: question)
    }
}

let numberOfCommands = fileIO.readInt()
command: for _ in 0..<numberOfCommands{
    
    let command = fileIO.readString()
    switch command{
        
    case "recommend":
        let category = fileIO.readInt()
        let level = fileIO.readInt()
        if(level == 1){
            //알고리즘 분류 -> category인 것 중 가장 난이도가 높은 문제 출력
            let queueIndex = categoryHashIndex[category]
            while(true){
                let peek = maxCategoryHash[queueIndex].peek!
                if(validation[peek.index]){
                    break
                }
                _ = maxCategoryHash[queueIndex].remove()
            }
            print(maxCategoryHash[queueIndex].peek!.id)
        }else{ //level == -1
            let queueIndex = categoryHashIndex[category]
            while(true){
                let peek = minCategoryHash[queueIndex].peek!
                if(validation[peek.index]){
                    break
                }
                _ = minCategoryHash[queueIndex].remove()
            }
            print(minCategoryHash[queueIndex].peek!.id)
        }
        continue
        
    case "recommend2":
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
        
    case "recommend3":
        let x = fileIO.readInt()
        let level = fileIO.readInt()
        
        if(x == 1){
            //알고리즘 분류 상관없이 level 이상인 문제 중 가장 쉬운 문제 -> 문제 번호 작은 것 -> 없으면 -1 출력
            let upLevel = levelHashIndex[level...100].filter({ $0 != -1 })
            if (upLevel.isEmpty){
                print("-1")
                continue
            }
            
            for i in upLevel{
                guard let peek = minLevelHash[i].peek else {
                    continue
                }
                if(validation[peek.index]){
                    print(peek.id)
                    continue command
                }
                _ = minLevelHash[i].remove()
            }
            print("-1")
        }else{ //x == -1
            //알고리즘 분류 상관없이 level 미만인 문제 중 가장 어려운 문제 -> 문제 번호 큰 것 -> 없으면 -1 출력
            let downLevel = levelHashIndex[1..<level].filter({ $0 != -1 })
            if (downLevel.isEmpty){
                print("-1")
                continue
            }
            
            for i in downLevel.reversed(){
                guard let peek = maxLevelHash[i].peek else {
                    continue
                }
                if(validation[peek.index]){
                    print(peek.id)
                    continue command
                }
                _ = maxLevelHash[i].remove()
            }
            print("-1")
        }
        continue
    case "add":
        let id = fileIO.readInt()
        let level = fileIO.readInt()
        let category = fileIO.readInt()
        
        let question = Question(index: questionIndexManage.count,id: id, level: level, category: category)
        maxQueue.insert(node: question)
        minQueue.insert(node: question)
        
        if(levelHashIndex[level] == -1){
            levelHashIndex[level] = maxLevelHash.count
            
            var maxHeap = Heap<Question>(sortFunction: >)
            maxHeap.insert(node: question)
            var minHeap = Heap<Question>(sortFunction: <)
            minHeap.insert(node: question)
            
            maxLevelHash.append(maxHeap)
            minLevelHash.append(minHeap)
        }else{
            maxLevelHash[levelHashIndex[level]].insert(node: question)
            minLevelHash[levelHashIndex[level]].insert(node: question)
        }
        
        if(categoryHashIndex[category] == -1){
            categoryHashIndex[category] = maxCategoryHash.count
            
            var maxHeap = Heap<Question>(sortFunction: >)
            maxHeap.insert(node: question)
            var minHeap = Heap<Question>(sortFunction: <)
            minHeap.insert(node: question)
            
            maxCategoryHash.append(maxHeap)
            minCategoryHash.append(minHeap)
        }else{
            maxCategoryHash[categoryHashIndex[category]].insert(node: question)
            minCategoryHash[categoryHashIndex[category]].insert(node: question)
        }
        
        questionIndexManage[id] = validation.count
        validation.append(true)
        continue
        
    case "solved":
        let id = fileIO.readInt()
        validation[questionIndexManage[id]!] = false
        continue
    default:
        continue
    }
}

