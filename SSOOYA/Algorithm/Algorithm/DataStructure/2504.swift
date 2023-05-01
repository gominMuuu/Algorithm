//
//  2504.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/01.
//

import Foundation

let bracket = readLine()!.map{ $0 }
var index = 0

func calculateNew(deep: Int) -> Int{
    
    func checkValidation(open: Character, ans: Int) -> Int{
        
        if stack.last != open{
            print(0); exit(0)
        }
        stack.removeLast()

        let count = open == "(" ? 2 : 3
        let pre = bracket[index - 1]
        
        if pre == "(" || pre == "["{
            return ans + count
        }else{
            return ans * count
        }
    }
    
    var ans = 0
    var stack = [Character]()
    
    stack.append(bracket[index])
    index += 1
    
    while index < bracket.count{
        let element = bracket[index]
        switch element{
        case "(","[":
            if [")", "]"].contains(bracket[index-1]){ //!stack.isEmpty &&
                ans += calculateNew(deep: deep + 1); continue
            }
            stack.append(element)
        case ")":
            ans = checkValidation(open: "(", ans: ans)
        case "]":
            ans = checkValidation(open: "[", ans: ans)
        default:    continue
        }
        index += 1
        if stack.isEmpty && deep != 0{
            return ans
        }
    }
    return stack.isEmpty ? ans : 0
}

print(calculateNew(deep: 0))
