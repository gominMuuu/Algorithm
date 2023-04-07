//
//  14888.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/07.
//

import Foundation

let n = Int(readLine()!)!
let num = readLine()!.split(separator: " ").map{ Int($0)! }
var operators = readLine()!.split(separator: " ").map{ Int($0)! }

var result = [-Int.max, Int.max] //최소, 최대

func dfs(index: Int, sum: Int){

    if(index == n){
        result[0] = max(result[0], sum)
        result[1] = min(result[1], sum)
        return
    }

    for i in 0..<4{
        if(operators[i] > 0){
            operators[i] -= 1
            switch i {
            case 0:
                dfs(index: index + 1, sum: sum + num[index])
            case 1:
                dfs(index: index + 1, sum: sum - num[index])
            case 2:
                dfs(index: index + 1, sum: sum * num[index])
            case 3:
                dfs(index: index + 1, sum: sum / num[index])
            default:
                continue
            }
            operators[i] += 1
        }
    }
}

dfs(index: 1, sum: num.first!)

result.forEach{
    print($0)
}
