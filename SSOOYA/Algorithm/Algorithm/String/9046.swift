//
//  9046.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/18.
//
//  백준 9046번 복호화
//  https://www.acmicpc.net/problem/9046

import Foundation

let count = Int(readLine()!)!
var result = [Character]()
for _ in 1...count{
    
    let cryto = readLine()!
    
    var characterDict = [Character:Int]()
    var maxCharacter = cryto[cryto.startIndex]
    for char in cryto{
        if(char == " "){ //공백 제거 필수
            continue
        }
        
        guard let value = characterDict[char] else {
            characterDict[char] = 1
            continue
        }
        
        characterDict[char] = value + 1
        
        if(characterDict[char]! > characterDict[maxCharacter]!){
            maxCharacter = char
        }
    }
    
    let maxElements = characterDict.filter({ $0.value == characterDict[maxCharacter]})
    let element = maxElements.count == 1 ? maxElements.keys.first! : "?"
    result.append(element)
}

result.forEach{
    print($0)
}
