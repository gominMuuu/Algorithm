//
//  18222.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/11.
//

import Foundation

let n = Int(readLine()!)!

//가장 가까운 2의 k승 찾기
var powTest = n
var k = 0
while(powTest != 1){
    powTest /= 2
    k += 1
}

let powValue = Int(pow(2.0, Double(k)))
var string = ["1","0", "1"] //index 1부터 보기
var targetIndex = n - powValue
func divide(m: Int){
    if(string.count - 1 < m){
        divide(m: m / 2)
    }
    let slice = Array(string[1...m]).map{ $0 == "0" ? "1" : "0"}
    string.append(contentsOf: slice)

    if(targetIndex < m){
        if(n <= 2){
            print(string[n])
        }else{
            string[targetIndex] == "0" ? print("1") : print("0")
        }
        exit(0)
    }
}

divide(m: powValue)
