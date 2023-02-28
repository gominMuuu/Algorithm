//
//  22860.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/28.
//

import Foundation

let size = readLine()!.split(separator: " ").map({ Int($0)! })
let n = size[0] //폴더
let m = size[1] //파일

//상위폴더 / 파일 이름 / 폴더 여부(폴더 -> 1, 폴더x -> 0)
//ex. main FolderA 1


var directory = [String: [String]]()
var files = [String: [String]]()
for _ in 1...n+m{
    let info = readLine()!.split(separator: " ").map({ String($0) })
    
    if(directory[info[0]] == nil){
        directory[info[0]] = []
    }
    directory[info[0]]!.append(info[1])
    if(info[2] == "1" && directory[info[1]] == nil){
        directory[info[1]] = []
    }
}

var types = Set<String>()
var counts = [String]()

func searchFile(key: String){
    if(directory[key] == nil){
        types.insert(key)
        counts.append(key)
    }
    directory[key]?.forEach{
        searchFile(key: $0)
    }
}

//쿼리 개수
var result = [String]()
let q = Int(readLine()!)!
var query: [String]
for _ in 1...q{
    
    query = readLine()!.split(separator: "/").map({ String($0) })
    types.removeAll()
    counts.removeAll()
    
    searchFile(key: query.last!)
    
    //(종류, 개수) 출력
    result.append("\(types.count) \(counts.count)")
}
result.forEach{
    print($0)
}
