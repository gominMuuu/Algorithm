//
//  2696.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/11.
//
//  백준 2696번 중앙값 구하기
//  https://www.acmicpc.net/problem/2696

import Foundation

let fileIO = FileIO()
let test = fileIO.readInt()

for _ in 0..<test{
    
    let size = fileIO.readInt()
    var result = [Int]()
    var median: Int!
    var maxHeap = Heap<Int>(sortFunction: >) //중앙값보다 작은 값 저장
    var minHeap = Heap<Int>(sortFunction: <) //중앙값보다 큰 값 저장
    for i in 1...size{
        
        let value = fileIO.readInt()
        
        //중앙값 인덱스를 index라 할 때
        //index-1, index, index+1 세 가지 값만 활용하는게 목표
        //index-1을 위해서는 최대 우선순위 큐를, index+1을 위해서는 최소 우선순위 큐를 사용.
        
        if(i == 1){
            median = value
            result.append(value)
            continue
        }
        
        value > median ? minHeap.insert(node: value) : maxHeap.insert(node: value)
        
        if(i % 2 == 0){
            continue
        }
        
        if(maxHeap.count == minHeap.count){
            result.append(median)
        }else if(abs(maxHeap.count - minHeap.count) > 1){
            
            let newMedian: Int!
            if(maxHeap.count > minHeap.count){
                minHeap.insert(node: median)
                newMedian = maxHeap.remove()!
            }else{
                maxHeap.insert(node: median)
                newMedian = minHeap.remove()!
            }
            result.append(newMedian)
            median = newMedian
        }
    }
    
    //출력
    var resultString = ""
    var indexCount = 1
    result.forEach{
        indexCount % 10 != 0 ? resultString.write("\($0) ") : resultString.write("\($0)\n")
        indexCount = indexCount + 1
    }
    print(result.count)
    print(resultString)
}
