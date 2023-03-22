//
//  20436.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/22.
//

import Foundation

var keyboard = [Character:(Int, Int)]()
let keyboardInfo = ["qwertyuiop", "asdfghjkl", "zxcvbnm"]
for (i, row) in keyboardInfo.enumerated(){
    for (j, c) in row.enumerated(){
        keyboard[c] = (i, j)
    }
}

var location: [(Int, Int)] = readLine()!.split(separator: " ").map{ keyboard[Character(String($0))]! }
let string = Array(readLine()!)

var distance = 0
for c in string{
    let targetCoord = keyboard[c]!
    if((targetCoord.0 <= 1 && targetCoord.1 >= 5) || (targetCoord.0 == 2 && targetCoord.1 >= 4)){
        //모음인 경우 > 오른쪽 자판
        let calculate = abs(location[1].0 - targetCoord.0) + abs(location[1].1 - targetCoord.1)
        distance += calculate
        location[1] = targetCoord
    }else{
        let calculate = abs(location[0].0 - targetCoord.0) + abs(location[0].1 - targetCoord.1)
        distance += calculate
        location[0] = targetCoord
    }
}

print(string.count + distance)
