//
//  9663.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/06.
//

import Foundation

let n = Int(readLine()!)!
var chess = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var count = 0

func backtracking(cnt: Int, queen: Int){

    let row = cnt / n
    let col = cnt % n

    if(queen == n){
        count += 1; return
    }else if(row < 0 || row >= n || col < 0 || col >= n){
        return
    }
    
    backtracking(cnt: cnt + 1, queen: queen)
        
    if(!check(row: row, col: col)){
        chess[row][col] = 1
        backtracking(cnt: cnt + 1, queen: queen + 1)
        chess[row][col] = 0
    }
}

func check(row: Int, col: Int) -> Bool{
    for i in 0..<n{
        if(chess[row][i] == 1 || chess[i][col] == 1){
            return true
        }
    }
    
    var diagRow = 0
    var diagCol = col - row
    for _ in 0..<n{
        if(diagRow >= 0 && diagRow < n && diagCol >= 0 && diagCol < n){
            if(chess[diagRow][diagCol] == 1){
                return true
            }
            diagRow += 1
            diagCol += 1
        }
    }
    
    diagRow = row - col
    diagCol = n - 1
    for _ in 0..<n{
        if(diagRow >= 0 && diagRow < n && diagCol >= 0 && diagCol < n){
            if(chess[diagRow][diagCol] == 1){
                return true
            }
            diagRow += 1
            diagCol -= 1
        }
    }
    return false
}


backtracking(cnt: 0, queen: 0)
print(count)
