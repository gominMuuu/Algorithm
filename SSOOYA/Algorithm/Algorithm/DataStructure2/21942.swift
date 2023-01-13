//
//  21942.swift
//  Algorithm
//
//  Created by 박지윤 on 2023/01/12.
//
//  백준 21942번 부품 대여장
//  https://www.acmicpc.net/problem/21942

import Foundation

let fileIO = FileIO()
//입력 데이터
let count = fileIO.readInt()
let term = fileIO.readString()
let fine = fileIO.readInt()

struct SystemInput: Equatable, Hashable{
    let product: String
    let name: String
    
    static func == (lhs: SystemInput, rhs: SystemInput) -> Bool{
        lhs.name == rhs.name && lhs.product == rhs.product
    }
}

var dictionary = [SystemInput:Date]()
var result = [String]()

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

//term 분 단위 가공
let termSplit = term.split(separator: "/")
let termTime = termSplit[1].split(separator: ":").map({ Int($0)! })
let termByMinute = Int(termSplit[0])! * 24 * 60 + termTime[0] * 60 + termTime[1]

for _ in 0..<count{
    
    let time = fileIO.readString() + " " + fileIO.readString()
    let timeConvert = dateFormatter.date(from: time)!
    let product = fileIO.readString()
    let name = fileIO.readString()
    
    let input = SystemInput(product: product, name: name)
    if(dictionary[input] == nil){
        dictionary[SystemInput(product: product, name: name)] = timeConvert
        continue
    }
    
    //시간 계산 후, 벌금 계산
    let timeInterval = Int(DateInterval(start: dictionary[input]!, end: timeConvert).duration / 60)
    dictionary.removeValue(forKey: input)
    if(timeInterval <= termByMinute){
        continue
    }
    
    let userFine = (timeInterval - termByMinute) * fine
    result.append("\(name) \(userFine)")
}

if(result.isEmpty){
    print("-1")
    exit(0)
}
result.sort()
result.forEach{
    print($0)
}


