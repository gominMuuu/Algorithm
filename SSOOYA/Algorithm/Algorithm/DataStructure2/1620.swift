//
//  1620.swift
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

struct Pocketmon: Hashable{
    let id: Int
    let name: String
}

let fileIO = FileIO()

let dictionarySize = fileIO.readInt()
let questionSize = fileIO.readInt()

var nameDictionary = [String: Int]()
var numberDictionary = [Int: String]()


for index in 1...dictionarySize{
    let pocketmon = fileIO.readString()
    nameDictionary[pocketmon] = index
    numberDictionary[index] = pocketmon
}

for _ in 1...questionSize{
    
    let question = fileIO.readString()
    
    //포켓몬 이름인지, 포켓몬 번호인지 구별
    if let number = Int(question){
        print(numberDictionary[number]!)
        continue
    }
    
    print(nameDictionary[question]!)
}

