//
//  6416_retry.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/26.
//

import Foundation

let fileIO = FileIO()
var caseCount = 1

var inHash = [Int: Int]()
var outHash = [Int: [Int]]()

var u = fileIO.readInt()
var v = fileIO.readInt()

var isTreeBoolean = true

func isTree() -> Bool{
    
    if(!isTreeBoolean){
        print("here3?")
        return false
    }
    
    let root = inHash.filter{ $0.value == 0 }
    if(root.count == 0 || root.count > 1){
        print("here2?")
        return false
    }
    
    var node = root.keys.first!
    var queue = Queue<Int>()
    queue.enqueue(node)
    inHash.removeValue(forKey: node)
    
    while(!queue.isEmpty()){
        node = queue.dequeue()!
        outHash[node]?.forEach{
            if(inHash[$0] != nil){
                queue.enqueue($0)
                inHash.removeValue(forKey: $0)
            }
        }
    }
    
    if(inHash.count > 0){
        print("here?")
        return false
    }

    return true
}


while(u >= 0 && v >= 0){
    
    if(u == 0 && v == 0){
        isTree() ? print("Case \(caseCount) is a tree.") : print("Case \(caseCount) is not a tree.")
        
        caseCount = caseCount + 1
        outHash = [:]
        inHash = [:]
        isTreeBoolean = true
    }
    
    if(inHash[v] == nil){
        inHash[v] = u
    }else{
        isTreeBoolean = false
    }

    if(outHash[u] == nil){
        outHash[u] = []
    }
    outHash[u]?.append(v)
    
    u = fileIO.readInt()
    v = fileIO.readInt()
}
