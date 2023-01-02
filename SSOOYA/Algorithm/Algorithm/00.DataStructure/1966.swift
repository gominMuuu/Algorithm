//
//  1966.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/02.
//

import Foundation

typealias Element = Int

struct Queue{
    var data: [Int] = []
    
    mutating func enqueue(_ element: Element){
        data.append(element)
    }
    
    mutating func dequeue() -> Element{
        let element = data.remove(at: 0)
        return element
    }
    
    func getMaxElement() -> Element?{
        data.max()
    }
    func getMaxElementIndex() -> Int?{
        guard let max = getMaxElement() else { return nil }
        return data.firstIndex(of: max)
    }
    func getElementCount() -> Int{
        data.count
    }
}

let testCount = Int(readLine()!)!

for _ in 0..<testCount{
    var docCountAndWantFind: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let importances: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    
    var count = 1
    if(docCountAndWantFind[0] == 1){
        print(count)
        continue
    }
    
    var queueTest = Queue()
    importances.forEach{
        queueTest.enqueue($0)
    }
    
    while(true){
        let max = queueTest.getMaxElement()
        let maxIndex = queueTest.getMaxElementIndex()
        let element = queueTest.dequeue()

        if(element == max){
            if(maxIndex == docCountAndWantFind[1]){
                print(count)
                break
            }
            count = count + 1
        }else{
            queueTest.enqueue(element)
        }
        
        docCountAndWantFind[1] = docCountAndWantFind[1] - 1
        if(docCountAndWantFind[1] < 0){
            docCountAndWantFind[1] = docCountAndWantFind[1] + queueTest.getElementCount()
        }
    }
}

