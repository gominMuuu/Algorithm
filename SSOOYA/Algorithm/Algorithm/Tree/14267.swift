//
//  14267.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/01/25.
//
//  백준 14267번 회사 문화 1
//  https://www.acmicpc.net/problem/14267

import Foundation

struct Employee{
    let id: Int
    var childIndex: [Int]
}

let fileIO = FileIO()
let employeeAmount = fileIO.readInt()
let complimentAmount = fileIO.readInt()

var tree = [Employee]()
tree.append(Employee(id: 0, childIndex: []))
tree.append(Employee(id: 1, childIndex: []))//initial

for i in 1...employeeAmount{
    let superior = fileIO.readInt()
    if(superior == -1){
        continue
    }
    tree.append(Employee(id: i, childIndex: []))
    tree[superior].childIndex.append(i)
}

var complimentInfo = [Int: Int]()
for _ in 1...complimentAmount{
    let employee = fileIO.readInt()
    let amount = fileIO.readInt()
    guard let temp = complimentInfo[employee] else {
        complimentInfo[employee] = amount
        continue
    }
    complimentInfo[employee] = amount + temp
}

var result = [Int](repeating: 0, count: employeeAmount)
func compliment(employee: Int, _ count: Int){
    result[employee - 1] = count
    tree[employee].childIndex.forEach{
        let info = complimentInfo[$0] ?? 0
        compliment(employee: $0, count + info)
    }
}

compliment(employee: 1, 0)
var ans = ""
result.forEach{
    ans.write("\($0) ")
}
print(ans.trimmingCharacters(in: .whitespaces))
