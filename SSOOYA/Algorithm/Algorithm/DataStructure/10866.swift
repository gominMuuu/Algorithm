//
//  10866.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/05.
//

import Foundation

let n = Int(readLine()!)!

var dequeue = [Int]()
var isEmpty: Bool{
    return dequeue.isEmpty
}

var ans = [Int]()
for _ in 1...n{
    let command = readLine()!.split(separator: " ")
    switch command[0]{
    case "push_front":
        dequeue.insert(Int(command[1])!, at: 0)
    case "push_back":
        dequeue.append(Int(command[1])!)
    case "pop_front":
        isEmpty ? ans.append(-1) : ans.append(dequeue.removeFirst())
    case "pop_back":
        isEmpty ? ans.append(-1) : ans.append(dequeue.removeLast())
    case "size":
        ans.append(dequeue.count)
    case "empty":
        ans.append(isEmpty ? 1 : 0)
    case "front":
        ans.append(isEmpty ? -1 : dequeue.first!)
    case "back":
        ans.append(isEmpty ? -1 : dequeue.last!)
    default:    continue
    }
}

ans.forEach{
    print($0)
}
