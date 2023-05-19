//
//  1967.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/19.
//

import Foundation

let n = Int(readLine()!)!

var tree = [[Int]](repeating: [], count: n+1)
var weights = [Int](repeating: 0, count: n+1)
for _ in 1..<n{
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    let (parent, child, weight) = (info[0], info[1], info[2])
    tree[parent].append(child)
    weights[child] = weight
}

var ans = 0
func dfs(node: Int) -> Int{
    
    if tree[node].isEmpty {
        return weights[node]
    }

    var tempArray = [Int]()
    for i in tree[node]{
        let value = dfs(node: i)
        tempArray.append(value)
    }
    tempArray.sort(by: >)
    
    var temp = 0
    for i in 0...min(1,tempArray.count-1){
        temp += tempArray[i]
    }
    let maxValue = tempArray.first ?? 0
    ans = max(temp,ans)
    return maxValue + weights[node]
}

_ = dfs(node: 1)
print(ans)
