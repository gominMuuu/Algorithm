//
//  11728.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/24.
//

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
let a = size[0]
let b = size[1]

let aArray = readLine()!.split(separator: " ").map({ Int($0)! })
let bArray = readLine()!.split(separator: " ").map({ Int($0)! })

var aPointer = 0
var bPointer = 0

var result = ""

while(aPointer < a && bPointer < b){
    if(aArray[aPointer] <= bArray[bPointer]){
        result.write("\(aArray[aPointer]) ")
        aPointer += 1
    }else{
        result.write("\(bArray[bPointer]) ")
        bPointer += 1
    }
}

while(aPointer < a){
    result.write("\(aArray[aPointer]) ")
    aPointer += 1
}

while(bPointer < b){
    result.write("\(bArray[bPointer]) ")
    bPointer += 1
}

print(result)

