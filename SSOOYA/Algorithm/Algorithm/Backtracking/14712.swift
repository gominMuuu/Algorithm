//
//  14712.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/05.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let n = info[0]
let m = info[1]

var validation = [[Bool]](repeating: [Bool](repeating: false, count: m+1), count: n+1)
var count = 0

func dfs(x: Int, y: Int){
    if(x == 1 && y == n+1){
        count += 1; return
    }
    
    var nx: Int!
    var ny: Int!
    if (x == m){
        nx = 1
        ny = y + 1
    }else{
        nx = x + 1
        ny = y
    }
    
    dfs(x: nx, y: ny)
    
    if(validation[y - 1][x] == false || validation[y - 1][x - 1] == false || validation[y][x - 1] == false){
        validation[y][x] = true
        dfs(x: nx, y: ny)
        validation[y][x] = false
    }
}

dfs(x: 1, y: 1)

print(count)
