//
//  9536.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation

let testCase = Int(readLine()!)!
var ans = [String]()
for _ in 0..<testCase{
    
    let record = readLine()!.split(separator: " ").map{ String($0) }
    var weeping = Set<String>()
    while true {
        let animal = readLine()!
        if animal == "what does the fox say?" {
            break
        }
        let slice = animal.split(separator: " ").map{ String($0) }
        weeping.insert(slice[2])
    }

    var fox = ""
    for weep in record{
        if !weeping.contains(weep){
            fox.write("\(weep) ")
        }
    }
    ans.append(fox)
}

ans.forEach{
    print($0)
}
