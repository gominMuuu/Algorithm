//
//  20438.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/18.
//

import Foundation

/*
 0: 학생의 수 N
 3: 주어질 구간의 수 M
 */
let info1 = readLine()!.split(separator: " ").map{ Int($0)! }

//0: K명의 졸고 있는 학생의 입장 번호들
let sleep = readLine()!.split(separator: " ").map{ Int($0)! }
//1: Q명의 출석 코드를 받을 학생의 입장 번호
let receive = readLine()!.split(separator: " ").map{ Int($0)! }

var isSleep = [Bool](repeating: false, count: info1[0]+3)
for i in sleep{
    isSleep[i] = true
}
//출석체크
var check = [Bool](repeating: false, count: info1[0]+3)
for student in receive{
    if(isSleep[student]){
        continue
    }
    var multi = 1
    while(student * multi < info1[0]+3){
        if(!isSleep[student * multi]){
            check[student * multi] = true
        }
        multi += 1
    }
}

//누적 합
var sum = [Int](repeating: 0, count: info1[0]+3)
for i in 3..<info1[0]+3{
    sum[i] = !check[i] ? sum[i-1] + 1 : sum[i-1]
}
print(sum)
//4번째 줄부터 M개의 줄 동안 구간의 범위 S, E가 공백을 사이에 두고 주어진다.
var ans = [Int]()
for _ in 1...info1[3]{
    let section = readLine()!.split(separator: " ").map{ Int($0)! }
    let end = sum[section[1]]
    let start = sum[section[0] - 1]
    ans.append(end - start)
}

ans.forEach{
    print($0)
}
