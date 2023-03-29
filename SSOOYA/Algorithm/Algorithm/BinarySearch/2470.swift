//
//  2470.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/29.
//

import Foundation

let n = Int(readLine()!)!
let data = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)

func binary(){
    var ans = (Int.max / 2, Int.max / 2)
    for (index,i) in data.enumerated(){
        
        let target = -i
        var current = Int.max / 2
        func binarySearch(left: Int, right: Int){
            if(left > right){
                return
            }
            let mid = (left + right) / 2
            if(mid != index && (abs(target - data[mid]) < abs(target - current))){
                current = data[mid]
            }
            
            if(data[mid] == target){
                ans = (min(i, data[mid]), max(i, data[mid])); return
            }else if(data[mid] > target){
                binarySearch(left: left, right: mid-1)
            }else{
                binarySearch(left: mid+1, right: right)
            }
        }
        
        binarySearch(left: data.startIndex, right: data.count - 1)
        if(abs(ans.0 + ans.1) > abs(i + current)){
            ans = (min(i, current), max(i, current))
        }
    }
    
    print(ans.0, ans.1)
}

func twoPointer(){
    var left = 0
    var right = data.count - 1
    var temp = (2000000000, 2000000000)
    while(left < right){
        if(abs(temp.0 + temp.1) > abs(data[left] + data[right])){
            temp = (data[left], data[right])
        }
        if(data[left] + data[right] > 0){
            right -= 1
        }else if(data[left] + data[right] < 0){
            left += 1
        }else{
            break
        }
    }
    print(temp.0, temp.1)
}

twoPointer()
