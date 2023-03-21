//
//  5212.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/21.
//

import Foundation

let size = readLine()!.split(separator: " ").map{ Int($0)! }
var map = [[Character]]()
var ground = [(Int,Int)]()
for i in 0..<size[0]{
    let info = Array(readLine()!)
    map.append(info)
    for (j,c) in info.enumerated(){
        if(c == "X"){
            ground.append((i, j))
        }
    }
}

let direction = [(-1,0), (0,-1), (0,1), (1,0)]
var remainGround = [(Int, Int)]()
for coord in ground{
    let count = direction.reduce(0){ count, d in
        return coord.0 + d.0 < 0 || coord.0 + d.0 >= size[0] || coord.1 + d.1 < 0 || coord.1 + d.1 >= size[1] || map[coord.0 + d.0][coord.1 + d.1] == "." ? count + 1 : count
    }
    if(count < 3){
        remainGround.append(coord)
    }
}

var rectangle = [Int.max, Int.max, 0, 0] //최소 row, 최소 col, 최대 row, 최대 col
for i in remainGround{
    rectangle[0] = min(rectangle[0], i.0)
    rectangle[1] = min(rectangle[1], i.1)
    rectangle[2] = max(rectangle[2], i.0)
    rectangle[3] = max(rectangle[3], i.1)
}

var finalGround = [[String]](repeating: [String](repeating: ".", count: rectangle[3] + 1 - rectangle[1]), count: rectangle[2] + 1 - rectangle[0])

for i in remainGround{
    finalGround[i.0 - rectangle[0]][i.1-rectangle[1]] = "X"
}
for i in finalGround{
    print(i.joined())
}
