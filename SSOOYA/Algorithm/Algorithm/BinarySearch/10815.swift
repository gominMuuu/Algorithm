//
//  10815.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/28.
//

import Foundation

let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

let m = Int(readLine()!)!
let checkCards = readLine()!.split(separator: " ").map{ Int($0)! }

var target: Int = Int.max
var ans = ""
for i in checkCards{
    target = i
    binarySearch(left: cards.startIndex, right: cards.endIndex-1) //endIndex 프로퍼티는 '마지막 인덱스 + 1' 값 반환
}

func binarySearch(left: Int, right: Int){
    if(left > right){
        ans.write("0 "); return
    }
    let mid = (left + right) / 2
    if(cards[mid] == target){
        ans.write("1 "); return
    }else if(cards[mid] > target){
        binarySearch(left: left, right: mid-1)
    }else{
        binarySearch(left: mid+1, right: right)
    }
}
print(ans)
