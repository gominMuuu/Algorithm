//
//  2800.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/05.
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

typealias Element = String

struct Stack{
    
    private var data = [Element]()
    
    mutating func push(_ element: Element){
        data.append(element)
    }
    
    mutating func pop() -> Element?{
        return data.removeLast()
    }
    
    func peek() -> Element?{
        return data.last
    }
    
    func isEmpty() -> Bool{
        data.isEmpty
    }
}

let fileIO = FileIO()
let input: String = fileIO.readString()

var exprColleciton = [String]()

var includeFront = ""
var includeBack = ""

if let first = input.firstIndex(of: "("), let last = input.lastIndex(of: ")"){
    let startIndex = input.index(after: first)
    let endIndex = input.index(before: last)
    let range = startIndex...endIndex
    
    includeFront = String(input[...first])
    includeBack = String(input[last...])
    
    var excludeFront = ""
    var excludeBack = ""

    if(first != input.startIndex){
        let excludeStartIndex = input.index(before: first)
        excludeFront = String(input[...excludeStartIndex])
    }
    if(last != input.endIndex){
        let excludeEndIndex = input.index(after: last)
        excludeBack = String(input[excludeEndIndex...])
    }
    
    let expression: String = String(input[range])
    
    includeBracket(front: includeFront, expression, back: includeBack)
    includeBracket(front: excludeFront, expression, back: excludeBack)
}else{
    includeBracket(front: includeFront, input, back: includeBack)
}

func includeBracket(front: String,_ expr: String, back: String){

    guard let first = expr.firstIndex(of: "("), let last = expr.lastIndex(of: ")") else {
        //exprColleciton에 expr 저장
        var result = front
        result.write(expr)
        result.write(back)
        exprColleciton.append(result)
        return
    }
    
    //앞 괄호 이전 인덱스
    let frontEndIndex = expr.index(before: first)

    //뒷 괄호 이후 인덱스
    let backStartIndex = expr.index(after: last)

    //괄호 안 표현식
    let startIndex = expr.index(after: first)
    let endIndex = expr.index(before: last)
    let range = startIndex...endIndex

    let includeFront = String(expr[...first])
    let excludeFront = String(expr[...frontEndIndex])
    var includeBack = String(expr[last...])
    var excludeBack = String(expr[backStartIndex...])
    let expression: String = String(expr[range])
    
    var newIncludeFront = front
    newIncludeFront.write(includeFront)
    includeBack.write(back)
    
    var newExcludeFront = front
    newExcludeFront.write(excludeFront)
    excludeBack.write(back)

    includeBracket(front: newIncludeFront, expression, back: includeBack)
    includeBracket(front: newExcludeFront, expression, back: excludeBack)
}

var stack = Stack()
var tempStack = Stack()

for expr in exprColleciton{
    
    if(expr == input){
        continue
    }
    
    if(stack.isEmpty()){
        stack.push(expr)
        continue
    }
    
    while(!stack.isEmpty() && stack.peek()! < expr){
        tempStack.push(stack.pop()!)
    }
    stack.push(expr)
    while(!tempStack.isEmpty()){
        stack.push(tempStack.pop()!)
    }
    
}

while(!stack.isEmpty()){
    print(stack.pop()!)
}

