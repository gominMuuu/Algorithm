//
//  16637.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/06/30.
//

import Foundation

let n = Int(readLine()!)!
let expression = readLine()!.map{ String($0) }

if expression.count == 1 {
    print(expression.first!)
    exit(0)
}

var comb = Set<[Int]>()
func combination(_ bracket: [Int], _ index: Int){
    if index >= n{
        comb.insert(bracket); return
    }
    //괄호 포함
    if index != n-1 {
        combination(bracket + [index, index+2], index + 4)
    }
    //괄호 없이
    combination(bracket, index + 2)
}

combination([], 0)

var ans = -Int.max
func calculateBracket(_ start: Int, _ end: Int) -> Int{
    var temp = Int(expression[start])!
    for i in stride(from: start+2, to: end+1, by: +2){
        temp = calculate(expression[i-1], temp, Int(expression[i])!)
    }
    return temp
}

func calculate(_ op: String, _ temp: Int, _ value: Int) -> Int{
    var temp = temp
    switch op{
    case "+":       temp += value
    case "-":       temp -= value
    case "*":       temp *= value
    default:        fatalError()
    }
    return temp
}

for brackets in comb{
    if brackets.isEmpty { continue }
    var pointer = 0
    var index = 0
    var value = 0
    while index < n {
        if pointer < brackets.count && brackets[pointer] == index {
            let temp = calculateBracket(brackets[pointer], brackets[pointer+1])
            if index == 0 {
                value = temp
            } else {
                value = calculate(expression[index - 1], value, temp)
            }
            index = brackets[pointer+1] + 2
            pointer += 2
        } else {
            let temp = Int(expression[index])!
            if index == 0 {
                value = temp
            } else {
                value = calculate(expression[index - 1], value, temp)
            }
            index += 2
        }
    }
    ans = max(ans, value)
}

print(ans)

