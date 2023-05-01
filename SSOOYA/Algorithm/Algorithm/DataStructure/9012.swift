//
//  9012.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/02.
//

import Foundation

let n = Int(readLine()!)!
var ans = [Bool](repeating: true, count: n)
for i in 0..<n{
    let brackets = Array(readLine()!)
    var stack = [Character]()
    
    for b in brackets{
        if b == "(" {
            stack.append(b)
        } else { // ")"인 경우
            if stack.isEmpty {
                ans[i] = false; break
            }
            stack.removeLast()
        }
    }
    
    if ans[i] && !stack.isEmpty{
        ans[i] = false
    }
}

ans.forEach{
    $0 ? print("YES") : print("NO")
}
