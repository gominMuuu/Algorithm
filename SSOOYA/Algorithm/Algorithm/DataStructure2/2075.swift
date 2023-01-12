//
//  2075.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/12.
//
//  백준 2075번 N번째 큰 수
//  https://www.acmicpc.net/problem/2075

import Foundation

let fileIO = FileIO()
let size = fileIO.readInt()

var columnData = [[Int]](repeating: [Int](), count: size)

for i in 0..<size * size{
    let value = fileIO.readInt()
    columnData[i % size].append(value)
}

var priority = Heap<Int>(sortFunction: <) //size 개수만큼만 담음

//n번째 줄의 원소를 heap에 전부 담음
for i in 0..<size{
    priority.insert(node: columnData[i].removeLast())
}

var popArray = [Int?]()

if(size == 1){ //작성안하면 런타임 오류..
    print(priority.remove()!)
    exit(0)
}

for i in 0..<size{
    popArray.append(columnData[i].removeLast())
}

var minValue = priority.peek!

while(true){

    if(popArray.allSatisfy{ $0 == nil || $0! <= minValue}){
        if(priority.count >= size){
            break
        }else{
            popArray.forEach{
                if($0 != nil){
                    priority.insert(node: $0!)
                }
            }
            minValue = priority.peek!
            continue
        }
    }

    for column in 0..<size{
        
        guard let value = popArray[column] else { continue }
        
        if(value > minValue){
            if(priority.count < size){ //count 수 만큼만 저장안하고 마무리 출력때 개수에 맞춰서 heap.remove 시킬 경우 시간 초과 발생
                priority.insert(node: value)
            }else{
                _ = priority.remove()
                priority.insert(node: value)
            }
            minValue = priority.peek!
            popArray[column] = columnData[column].isEmpty ? nil : columnData[column].removeLast()
        }
    }
}

let result = priority.remove()!
print(result)

