//
//  1935.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/02.
//

import Foundation

//피연산자 수의 개수
var size = Int(readLine()!)!

//후위 표기식 입력 -> 스택 사용
var expression = readLine()!

typealias element = Int

struct Stack{
    var data: [element]
    var top: Int
}





