//
//  6416.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/26.
//

import Foundation

let fileIO = FileIO()

var caseCount = 1
var u = fileIO.readInt()
var v = fileIO.readInt()

var indexHash = [Int : Int]()
var inArray = [[Int]]()
var outArray = [[Int]]()

func isTree() -> Bool{
    
    var nodeCount = 1
    var queue = Queue<Int>()
    guard let root = inArray.firstIndex(of: []) else { return false }
    let rootKey = indexHash.filter{ $0.value == root }.keys.first!
    var validation = [Bool](repeating: true, count: indexHash.count)
    queue.enqueue(rootKey)
    validation[root] = false
    
    while(!queue.isEmpty()){
        let node = queue.dequeue()!
        guard let index = indexHash[node] else { continue }
        if(index != root && (inArray[index].count > 1 || inArray[index].isEmpty)){
            return false
        }
        outArray[index].forEach{
            let index = indexHash[$0]!
            if(validation[index]){
                queue.enqueue($0)
                validation[index] = false
                nodeCount = nodeCount + 1
            }
        }
    }
    
    if(nodeCount < indexHash.count){
        return false
    }
    return true
}

while(u >= 0 && v >= 0){
    
    if(u == 0 && v == 0){
        
        isTree() ? print("Case \(caseCount) is a tree.") : print("Case \(caseCount) is not a tree.")

        //초기화
        caseCount = caseCount + 1
        indexHash = [Int : Int]()
        inArray = [[Int]]()
        outArray = [[Int]]()
    }else{
        if(indexHash[u] == nil){
            indexHash[u] = indexHash.count
            inArray.append([])
            outArray.append([])
        }
        if(indexHash[v] == nil){
            indexHash[v] = indexHash.count
            inArray.append([])
            outArray.append([])
        }
        
        guard let u_index = indexHash[u], let v_index = indexHash[v] else { continue }
        inArray[v_index].append(u)
        outArray[u_index].append(v)
    }
    
    u = fileIO.readInt()
    v = fileIO.readInt()
}
