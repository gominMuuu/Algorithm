//
//  12871.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/10.
//

import Foundation

let a = readLine()!
let b = readLine()!

if String(repeating: a, count: b.count) == String(repeating: b, count: a.count){
    print(1)
} else{
    print(0)
}
