//
//  16171.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/08.
//

import Foundation

let notes: String = readLine()!.reduce(""){ $1.isNumber ? $0 : $0 + "\($1)" }
let keyword = readLine()!

print(notes.contains(keyword) ? 1 : 0)


