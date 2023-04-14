//
//  2448.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/13.
//

import Foundation

let n = Int(readLine()!)!
var star = [[String]](repeating: [String](repeating: " ", count: 2*n-1), count: n)

func divideAndConquer(size: Int, bottom: Int, left: Int){
    if(size == 3){
        [(bottom-2, left+2), (bottom-1,left+1), (bottom-1,left+3)].forEach{
            star[$0.0][$0.1] = "*"
        }
        for i in 0..<5{
            star[bottom][left + i] = "*"
        }
        return
    }
    
    //divide
    let divideSize = size/2
    divideAndConquer(size: divideSize, bottom: bottom, left: left)
    divideAndConquer(size: divideSize, bottom: bottom, left: left + 2 * divideSize)
    divideAndConquer(size: divideSize, bottom: bottom - divideSize, left: left + divideSize)
}

divideAndConquer(size: n, bottom: n-1, left: 0)
star.forEach{
    print($0.joined())
}
