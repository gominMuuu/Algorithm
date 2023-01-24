//
//  16916.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/20.
//
//  백준 16916번 부분 문자열
//  https://www.acmicpc.net/problem/16916

import Foundation

let string = readLine()!.map({ $0 })
let input = readLine()!.map({ $0 })

var charHash = [Character: [Int]]()
var index = -1
for i in string{
    index = index + 1
    if(charHash[i] == nil){
        charHash[i] = [index]
        continue
    }
    charHash[i]?.append(index)
}
var inputIndex = 0
let char = input[inputIndex]
guard let hash = charHash[char] else {
    print("0")
    exit(0)
}
var hashIndex = 0
while(hashIndex < hash.count){
    var checkIndex = hash[hashIndex]
    while(checkIndex < string.count && string[checkIndex] == input[inputIndex] ){
        inputIndex = inputIndex + 1
        checkIndex = checkIndex + 1
        if(inputIndex == input.count){
            print("1")
            exit(0)
        }
    }
    hashIndex = hashIndex + 1
    inputIndex = 0
}
print("0")
