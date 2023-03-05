//
//  4396.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/01.
//

import Foundation

let n = Int(readLine()!)!

var board = [[String]]()
for _ in 1...n{
    board.append(readLine()!.map({ String($0) }))
}

var location = [[String]]()
for _ in 1...n{
    location.append(readLine()!.map({ String($0) }))
}

//board에다가 출력값 바인딩
var validation = true //지뢰 밟았는지 안밟았는지 여부

for i in 0..<n{
    for j in 0..<n{
        if(location[i][j] == "x"){
            if(board[i][j] == "*"){
                validation = false
                continue
            }
            var count = 0
            for a in i-1...i+1{
                if(a < 0 || a >= n) { continue }
                for b in j-1...j+1{
                    if(b < 0 || b >= n) { continue }
                    if(board[a][b] == "*"){
                        count += 1
                    }
                }
                board[i][j] = "\(count)"
            }
        }
    }
}

if(validation){
    for i in 0..<n{
        for j in 0..<n{
            if(board[i][j] == "*"){
                board[i][j] = "."
            }
        }
    }
}
board.forEach{
    print($0.joined())
}

