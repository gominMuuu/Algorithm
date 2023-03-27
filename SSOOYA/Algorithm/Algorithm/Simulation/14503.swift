//
//  14503.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/24.
//

import Foundation

let size = readLine()!.split(separator: " ").map{ Int($0)! }
let cleanerInfo = readLine()!.split(separator: " ").map{ Int($0)! }

//0: 청소X, 1: 청소 완료, 2: 벽
var flag = [[Int]](repeating: [Int](repeating: 0, count: size[1]), count: size[0])
for i in 0..<size[0]{
    let row = readLine()!.split(separator: " ").map{ Int($0)! }
    for (j,c) in row.enumerated(){
        if(c == 1){
            flag[i][j] = 2
        }
    }
}

var location = (cleanerInfo[0], cleanerInfo[1])
var direction = cleanerInfo[2] //0: 북, 1: 동, 2: 남, 3: 서

var ans = 0
while(true){

    //벽 유효성 검사
    if(location.0 < 0 || location.0 >= size[0] || location.1 < 0 || location.1 >= size[1] || flag[location.0][location.1] == 2){
        break
    }
    
    if(flag[location.0][location.1] == 0){
        flag[location.0][location.1] = 1
        ans += 1
    }
    
    //주변 4칸 점검
    if(checkSurround()){
        direction = (direction - 1 + 4) % 4
        let check = checkFront()
        if(flag[check.0][check.1] == 0){
            location = check
        }
    }else{
        goBack()
    }
}

func checkSurround() -> Bool{
    let check = [(-1,0), (0,-1), (0,1), (1,0)]
    for i in check{
        if(location.0 + i.0 < 0 || location.0 + i.0 >= size[0] || location.1 + i.1 < 0 || location.1 + i.1 >= size[1] || flag[location.0 + i.0][location.1 + i.1] != 0){
            continue
        }
        return true
    }
    return false
}

func checkFront() -> (Int, Int){
    switch direction{
    case 0:
        return (location.0 - 1, location.1)
    case 1:
        return (location.0, location.1 + 1)
    case 2:
        return (location.0 + 1, location.1)
    case 3:
        return (location.0, location.1 - 1)
    default:
        exit(0)
    }
}

func goBack(){
    switch direction{
    case 0:
        location = (location.0 + 1, location.1)
    case 1:
        location = (location.0, location.1 - 1)
    case 2:
        location = (location.0 - 1, location.1)
    case 3:
        location = (location.0, location.1 + 1)
    default:
        return
    }
}

print(ans)
