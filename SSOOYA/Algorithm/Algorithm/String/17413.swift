//
//  17413.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/17.
//
//  백준 1764번 단어 뒤집기 2
//  https://www.acmicpc.net/problem/17413

import Foundation

let input = readLine()!
var stack = Stack<Character>()

func reverseString(){
    while(!stack.isEmpty()){
        print(stack.pop(), terminator: "")
    }
}

for char in input{
    
    switch char{
    case "<":
        reverseString()
        stack.push("<")
        break
    case ">":
        _ = stack.pop()
        break
    case " ":
        if(stack.peek() == "<"){
            break
        }
        reverseString()
        break
    default:
        if(stack.peek() == "<"){
            break
        }
        stack.push(char)
        continue
    }
    print(char, terminator: "")
}

reverseString()
