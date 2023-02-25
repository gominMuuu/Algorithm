//
//  20442.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/02/21.
//

import Foundation

let string = Array(readLine()!)


var lk = [Int]()
var rk = [Int]()
var cnt = 0

for i in string{
    if(i == "K"){
        cnt += 1
    }else{
        lk.append(cnt)
    }
}

cnt = 0
for i in string.reversed(){
    if(i == "K"){
        cnt += 1
    }else{
        rk.append(cnt)
    }
}
rk.reverse()

var l = 0
var r = lk.count - 1
var ans = 0

while(l <= r){
    ans = max(ans, r - l + 1 + 2 * min(lk[l], rk[r]))
    if (lk[l] < rk[r]){
        l += 1
    }else{
        r -= 1
    }
}
print(ans)
        
        
        
        

