//
//  1620.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/09.
//

import Foundation

struct Pocketmon: Hashable{
    let id: Int
    let name: String
}

let fileIO = FileIO()

let dictionarySize = fileIO.readInt()
let questionSize = fileIO.readInt()

var nameDictionary = [String: Int]()
var numberDictionary = [Int: String]()


for index in 1...dictionarySize{
    let pocketmon = fileIO.readString()
    nameDictionary[pocketmon] = index
    numberDictionary[index] = pocketmon
}

for _ in 1...questionSize{
    
    let question = fileIO.readString()
    
    //포켓몬 이름인지, 포켓몬 번호인지 구별
    if let number = Int(question){
        print(numberDictionary[number]!)
        continue
    }
    
    print(nameDictionary[question]!)
}

