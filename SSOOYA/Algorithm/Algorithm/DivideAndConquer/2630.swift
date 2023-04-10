//
//  2630.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/10.
//

import Foundation

let n = Int(readLine()!)!

var papers = [[Int]]()
for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    papers.append(input)
}

var result = [Int](repeating: 0, count: 2) //흰, 파
func divide(left: Int, right: Int, top: Int, bottom: Int){
    if allSatisfy(left: left, right: right, top: top, bottom: bottom) {
        result[papers[top][left]] += 1
    }else{
        let row = (top + bottom) / 2
        let col = (left + right) / 2
        divide(left: left, right: col, top: top, bottom: row)
        divide(left: left, right: col, top: row+1, bottom: bottom)
        divide(left: col+1, right: right, top: top, bottom: row)
        divide(left: col+1, right: right, top: row+1, bottom: bottom)
    }
}

func allSatisfy(left: Int, right: Int, top: Int, bottom: Int) -> Bool{
    let standard = papers[top][left]
    for i in top...bottom{
        for j in left...right{
            if(papers[i][j] != standard){
                return false
            }
        }
    }
    return true
}

divide(left: 0, right: n-1, top: 0, bottom: n-1)

result.forEach{
    print($0)
}
