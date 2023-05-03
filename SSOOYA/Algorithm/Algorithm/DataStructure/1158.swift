//
//  1158.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/03.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }

var isDelete = [Bool](repeating: false, count: info[0])
var deleteCount = 0

var index = 0
var ans = ""
while deleteCount < info[0] {
    var count = 0
    while count != info[1] {
        index = (index + 1) % info[0]
        if !isDelete[index] {
            count += 1
        }
    }

    isDelete[index] = true
    deleteCount == 0 ? ans.append("\(index)") : ans.append(", \(index)")
    deleteCount += 1
}

ans = ans.replacingOccurrences(of: "0", with: "\(info[0])")
print("<\(ans)>")
