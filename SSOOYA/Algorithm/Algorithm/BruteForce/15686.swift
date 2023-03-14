//
//  15686.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/14.
//

import Foundation

let info = readLine()!.split(separator: " ").map({ Int($0)! })
let size = info[0]
let notClose = info[1]

//0은 빈 칸, 1은 집, 2는 치킨집
var house = [(Int, Int)]()
var chicken = [(Int, Int)]()
for i in 0..<info[0]{
    let map = readLine()!.split(separator: " ").map({ Int($0)! })
    for (j, c) in map.enumerated(){
        if(c == 1){
            house.append((i, j))
        }else if(c == 2){
            chicken.append((i, j))
        }
    }
}

func combination<T>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }

    cycle(0,[])

    return result
}

var result = Int.max
for chickenStore in combination(chicken, notClose){
    var sum = 0
    for house in house{
        var houseMin = Int.max
        for chicken in chickenStore{
            let distance = abs(house.0 - chicken.0) + abs(house.1 - chicken.1)
            houseMin = min(houseMin, distance)
        }
        sum += houseMin
    }
    result = min(result, sum)
}


print(result)
