//
//  20210.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/19.
//
//  백준 20210번 파일 탐색기
//  https://www.acmicpc.net/problem/20210

import Foundation

let count = Int(readLine()!)!

var words = [[String]]()
for _ in 1...count{
    let input = readLine()!
    var word = [String]()
    var number = ""
    for i in input{
        let stringType = String(i)
        if (Int(stringType) != nil) {
            number.write(stringType)
            continue
        }
        if(!number.isEmpty){
            word.append(number)
            number = ""
        }
        word.append(stringType)
    }
    if(!number.isEmpty){
        word.append(number)
    }
    words.append(word)
}

func sort(l_index: Int, r_index: Int) -> Bool{
    
    let left = words[l_index]
    let right = words[r_index]
    var index = 0
    
    
    if(left.count == 1 && right.count == 1){
        return left[0] > right[0]
    }
    
    while(index < left.count && index < right.count){
        
        let leftChar = left[index]
        let rightChar = right[index]
        
        if(leftChar == rightChar){
            index = index + 1
            continue
        }
        
        if (Int(rightChar) != nil && Int(leftChar) == nil){
            return true
        }
        
        if let leftInt = Int(leftChar){
            
            guard let rightInt = Int(rightChar) else { return false }
            
            let l = leftChar.map({ Int(String($0))})
            let r = rightChar.map({ Int(String($0))})
            
            if(leftInt == rightInt){
                var i = 0
                while(true){
                    if(l[i] != 0){
                        return false
                    }else if(r[i] != 0){
                        return true
                    }
                    i = i + 1
                }
            }
            return leftInt < rightInt ? false : true //complete
        }
        
        if(leftChar.lowercased() == rightChar.lowercased()){
            return Character(leftChar).isUppercase ? false : true //complete
        }else{
            return leftChar.lowercased() > rightChar.lowercased() ? false : true
        }
    }
    return true
}

loop: for index in 1..<words.count{
    var i = index
    var j = i-1
    while(j >= 0){
        if(sort(l_index: j, r_index: i)){
            let temp = words.remove(at: i)
            words.insert(temp, at: j)
            i = j
            j = j - 1
            continue
        }
        continue loop
    }
}

for wordArray in words{
    var word = ""
    for i in wordArray{
        word.write(i)
    }
    print(word)
}
