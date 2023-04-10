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

func reference2(){
    
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = info[0]
    let m = info[1]

    var validation = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
    var ans = 0
    
    func dfs(cnt: Int) {
        if (cnt == n * m) {
            ans += 1; return
        }
        let y = cnt / m + 1;
        let x = cnt % m + 1;

        if (validation[y - 1][x] == 1 && validation[y][x - 1] == 1 && validation[y - 1][x - 1] == 1) {
            // 현재 놓을 수 없는 곳
            dfs(cnt: cnt + 1)
        } else {
            dfs(cnt: cnt + 1) // 선택안하고 다음꺼 본 경우
            validation[y][x] = 1;
            dfs(cnt: cnt + 1) // 선택하고 다음꺼 본 경우
            validation[y][x] = 0;
        }
    }
    
    dfs(cnt: 0)
    print(ans)
}

