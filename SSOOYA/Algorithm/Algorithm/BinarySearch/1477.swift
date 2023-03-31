//
//  1477.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/31.
//

import Foundation

let info = readLine()!.split(separator: " ").map{ Int($0)! }
let n = info[0]
let m = info[1]
let length = info[2]
var store = [0]
store.append(contentsOf: readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <))
store.append(length)

var start = 1
var end = length - 1
var result = 0
while(start <= end){
    var count = 0
    let mid = (start + end) / 2
    for i in stride(from: 1, to: store.count, by: +1){
        if(store[i] - store[i-1] > mid){
            count += (store[i] - store[i-1] - 1) / mid
        }
    }
    if (count > m){
        start = mid + 1
    }else{
        end = mid - 1
        result = mid
    }
}
print(result)
