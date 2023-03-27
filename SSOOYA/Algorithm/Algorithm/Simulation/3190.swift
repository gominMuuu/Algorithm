//
//  3190.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/23.
//

import Foundation

let n = Int(readLine()!)!

let appleCount = Int(readLine()!)!
var apples = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
for _ in 0..<appleCount{
    let coord = readLine()!.split(separator: " ").map{ Int($0)! }
    apples[coord[0]][coord[1]] = true
}

let directionCount = Int(readLine()!)!
var direction = [(Int, String)]() //시간, 방향
for _ in 1...directionCount{
    let info = readLine()!.split(separator: " ").map{ String($0) }
    direction.append((Int(info[0])!, info[1]))
}

//벽 또는 자기자신의 몸과 부딪히면 게임이 끝난다.
//왼쪽(C가 'L') 또는 오른쪽(C가 'D')

enum Move{
    case up, down, left, right
}

struct Location: Hashable{
    var x: Int
    var y: Int
}

func isSnakeCrash() -> Bool{
    location.count != Set(location).count ? true : false
}

func movingHead() -> Location{
    let head = location[0]
    switch moveDirection{
    case .up:           return Location(x: head.x - 1, y: head.y)
    case .down:         return Location(x: head.x + 1, y: head.y)
    case .left:         return Location(x: head.x, y: head.y - 1)
    case .right:        return Location(x: head.x, y: head.y + 1)
    }
}

func changeLeftDirection(){
    moveDirection = {
        switch moveDirection {
        case .up:       return .left
        case .down:     return .right
        case .left:     return .down
        case .right:    return .up
        }
    }()
}

func changeRightDirection(){
    moveDirection = {
        switch moveDirection {
        case .up:       return .right
        case .down:     return .left
        case .left:     return .up
        case .right:    return .down
        }
    }()
}

var time = 0
var directionPointer = 0
var location = [Location(x: 1, y: 1)]
var moveDirection = Move.right

while(true){

    location.insert(movingHead(), at: 0)
    time += 1
    let head = location[0]
    if(head.x < 1 || head.x > n || head.y < 1 || head.y > n || isSnakeCrash()){
        break
    }
    
    if(!apples[head.x][head.y]){
        location.removeLast()
    }else{
        apples[head.x][head.y] = false
    }
    
    if(directionPointer >= directionCount){
        continue
    }
    let willMove = direction[directionPointer]
    if(time == willMove.0){
        if(willMove.1 == "L"){
            changeLeftDirection()
        }else{
            changeRightDirection()
        }
        directionPointer += 1
    }
}

print(time)
