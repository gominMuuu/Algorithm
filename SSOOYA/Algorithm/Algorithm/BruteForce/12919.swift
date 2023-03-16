//
//  12919.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/16.
//

import Foundation

let s = Array(readLine()!)
let t = Array(readLine()!)

func dfs(string: [Character]){
    if(string.count == s.count){
        if(string == s){
            print(1)
            exit(0)
        }
        return
    }
    
    if(string.last! == "A"){
        dfs(string: Array(string[0..<string.count-1]))
    }
    
    if(string.first! == "B"){
        dfs(string: Array(string[1..<string.count]).reversed())
    }
}


dfs(string: t)
print(0)

/*
//solution 1. DFS > 시간 초과
func dfs(string: [Character], append: Character){
    if(string.count == t.count){
        if(string == t){
            print(1)
            exit(0)
        }
        return
    }
    
    var newString = string
    newString.append(append)
    if(append == "A"){
        bfs(string: newString, append: "A")
        bfs(string: newString, append: "B")
    }else{ //B
        let reversed: [Character] = newString.reversed()
        bfs(string: reversed, append: "A")
        bfs(string: reversed, append: "B")
    }
}

dfs(string: s, append: "A")
dfs(string: s, append: "B")
print(0)
 

//solution 2. BFS > 시간초과
var set = Set<[Character]>() //queue처럼 사용
set.insert(s)

while(!set.isEmpty){
    let element = set.removeFirst()
    if(element.count == t.count){
        if(element == t){
            print("1")
            exit(0)
        }
        continue
    }
    set.insert(element + ["A"])
    set.insert((element + ["B"]).reversed())
}

print(0)
*/
