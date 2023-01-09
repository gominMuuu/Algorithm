//
//  2800.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/09.
//
//  백준 2800번 괄호 제거
//  https://www.acmicpc.net/problem/2800

import Foundation

typealias Element = Int

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

struct Bracket{
    let start: Int
    let end: Int
}

let fileIO = FileIO()
let expression = fileIO.readString()

var brackets = [Bracket]()
var stack = Stack()

var index: Int = 0
for char in expression{
    
    switch char{
    case "(":
        stack.push(index)
        break
    case ")":
        brackets.append(Bracket(start: stack.pop()!, end: index))
        break
    default:
        break
    }
    
    index = index + 1
}

var result = Set<String>()

func includeBracket(index: Int, willRemove: [Int]){

    if(index + 1 < brackets.count){
        includeBracket(index: index + 1, willRemove: willRemove)
        removeBracket(index: index + 1, willRemove: willRemove)
        return
    }
    
    if(willRemove.isEmpty){
        return
    }
    
    let remove = willRemove.sorted(by: >) //내림차순 정렬
    var removeExpr = expression
    for i in remove{
        let removeIndex = expression.index(expression.startIndex, offsetBy: i)
        removeExpr = removeExpr.replacingCharacters(in: removeIndex...removeIndex, with: "")
    }
    result.insert(removeExpr)
}

func removeBracket(index: Int, willRemove: [Int]){
    
    var remove = willRemove
    remove.append(brackets[index].start)
    remove.append(brackets[index].end)

    if(index + 1 < brackets.count){
        includeBracket(index: index + 1, willRemove: remove)
        removeBracket(index: index + 1, willRemove: remove)
        return
    }
    
    remove = remove.sorted(by: >)
    var removeExpr = expression
    for i in remove{
        let removeIndex = expression.index(expression.startIndex, offsetBy: i)
        removeExpr = removeExpr.replacingCharacters(in: removeIndex...removeIndex, with: "")
    }
    result.insert(removeExpr)
}

let startIndex = brackets.startIndex
includeBracket(index: startIndex, willRemove: [Int]())
removeBracket(index: startIndex, willRemove: [Int]())

let answer = result.sorted()
answer.forEach{
    print($0)
}
