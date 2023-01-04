//
//  18258.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/04.
//

import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }


    @inline(__always) func readString() -> String {
            var str = ""
            var now = read()

            while now == 10
                    || now == 32 { now = read() } // 공백과 줄바꿈 무시

            while now != 10
                    && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
            }

            return str
        }
  }

struct Queue{
    var data = [Int]()
    
    mutating func push(_ element: Int){
        data.append(element)
    }
    
    mutating func pop() -> Int{
        isEmpty() ? -1 : data.removeFirst()
    }
    
    func size(){
        print(data.count)
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
    
    func front(){
        print(data.first ?? -1)
    }
    
    func back(){
        print(data.last ?? -1)
    }
}

let fileIO = FileIO()
var queue = Queue()

let commandCount = fileIO.readInt()

for _ in 1...commandCount{
    
    let command = fileIO.readString()
    
    switch command{
    case "push":
        let input = fileIO.readInt()
        queue.push(input)
        continue
    case "pop":
        print(queue.pop())
        continue
    case "size":
        queue.size()
        continue
    case "empty":
        queue.isEmpty() ? print("1") : print("0")
        continue
    case "front":
        queue.front()
        continue
    case "back":
        queue.back()
        continue
    default:
        continue
    }
}

