//
//  4659.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/09.
//

import Foundation

var testCase = [String]()
while true {
    let input = readLine()!
    if input == "end" {
        break
    }
    testCase.append(input)
}

let vowels = ["a", "e", "i", "o", "u"]
for test in testCase{
    
    var validation = true
    var contain = false
    
    let string = Array(test).map{ String($0) }
    for j in 0..<test.count{
        if !contain && vowels.contains(string[j]) {
            contain = true
        }
        if test.count >= 3 && j+2 < test.count {
            if string[j...j+2].allSatisfy({ vowels.contains($0) }) || string[j...j+2].allSatisfy({ !vowels.contains($0) }) {
                validation = false
            }
        }
        if test.count >= 2 && j+1 < test.count && string[j] == string[j+1] && (string[j] != "e" && string[j] != "o") {
            validation = false
        }
    }
    contain && validation ? print("<\(test)> is acceptable.") : print("<\(test)> is not acceptable.")
}
