//
//  2447.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/12.
//

import Foundation

let n = Int(readLine()!)!

var start = [[String]](repeating: [String](repeating: "*", count: n), count: n)

func divide(size: Int, left: Int, top: Int){
    if(size == 3){
        start[top+1][left+1] = " "; return
    }

    let divideSize = size/3
    for i in [top, top + divideSize, top + divideSize * 2]{
        for j in [left, left + divideSize, left + divideSize * 2]{
            divide(size: divideSize, left: j, top: i)
        }
    }
    
    for i in left+divideSize..<left+2*divideSize{
        for j in top+divideSize..<top+2*divideSize{
            start[j][i] = " "
        }
    }
}

divide(size: n, left: 0, top: 0)
for i in start{
    print(i.joined())
}
