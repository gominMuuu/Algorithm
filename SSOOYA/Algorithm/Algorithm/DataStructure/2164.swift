//
//  2164.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/04.
//

import Foundation

let n = Int(readLine()!)!

var temp = [Int]()
for i in 1...n{
    temp.append(i)
}

while temp.count != 1{
    
    var newTemp = [Int]()

    if temp.count % 2 == 1{
        newTemp.append(temp.last!)
    }
    
    var index = 1
    while index < temp.count{
        newTemp.append(temp[index])
        index += 2
    }
    
    temp = newTemp
}

print(temp.last!)
