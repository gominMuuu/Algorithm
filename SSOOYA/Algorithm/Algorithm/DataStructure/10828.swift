//
//  10828.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/09.
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

typealias Element = Int

struct Stack{
    
    private var data = [Element]()
    
    mutating func push(_ element: Element){
        data.append(element)
    }
    
    mutating func pop() -> Element?{
        if(empty()){
            print("-1")
            return nil
        }
        return data.removeLast()
    }
    
    func size() -> Int{
        data.count
    }
    
    func empty() -> Bool{
        data.isEmpty
    }
    
    func top() -> Element?{
        data.last
    }
}

let fileIO = FileIO()
let count = fileIO.readInt()

var stack = Stack()

for _ in 1...count{
    
    let command = fileIO.readString()
    
    switch command{
    case "push":
        let element = fileIO.readInt()
        stack.push(element)
        continue
    case "pop":
        if let pop = stack.pop() {
            print(pop)
            continue
        }
        continue
    case "size":
        print(stack.size())
        continue
    case "empty":
        stack.empty() ? print("1") : print("0")
        continue
    case "top":
        guard let top = stack.top() else {
            print("-1")
            continue
        }
        print(top)
        continue
    default:
        continue
    }
}
