//
//  2407.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (info[0], info[1])

var dp = [[String]](repeating: [String](repeating: "0", count: 101), count: 101)
for i in 1...n{
    let i = Int(i)
    dp[i][i] = "1"
    dp[i][0] = "1"
    dp[i][1] = "\(i)"
}

func sum(_ a: String, _ b: String) -> String{
    var ans: [String] = ["0"]
    var a = Array(a).reversed().map{ String($0) }
    var b = Array(b).reversed().map{ String($0) }
    
    if a.count < b.count {
        a.append(contentsOf: [String](repeating: "0", count: b.count - a.count))
    } else if a.count > b.count{
        b.append(contentsOf: [String](repeating: "0", count: a.count - b.count))
    }
    
    var index = 0
    while index < a.count {
        if index == ans.count {
            ans.append("0")
        }
        let calculate = String(Int(a[index])! + Int(b[index])! + Int(ans[index])!)
        let array = Array(calculate).map{ String($0) }
        ans.removeLast()
        ans.append(contentsOf: array.reversed())
        index += 1
    }
    return ans.reversed().joined()
}

func combination(_ n: Int, _ m: Int) -> String{
    if dp[n][m] == "0"{
        dp[n][m] = sum(combination(n-1, m-1), combination(n-1, m))
    }
    return dp[n][m]
}

print(combination(n, m))
