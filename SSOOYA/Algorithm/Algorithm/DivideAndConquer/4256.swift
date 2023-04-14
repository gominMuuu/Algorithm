//
//  4256.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/04/14.
//

import Foundation

let count = Int(readLine()!)!
var ans = [String]()
for _ in 1...count{
    let n = Int(readLine()!)!
    let preorder = readLine()!.split(separator: " ").map{ Int($0)! }
    let inorder = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var tree = [Int: (Int, Int)]()
    var preorderIndex = 0
    
    func search( start: Int, end: Int) -> Int{
        if(start > end){ return 0 }
        let node = preorder[preorderIndex]
        tree[node] = (0,0)
        preorderIndex += 1
        let index = inorder.firstIndex(of: node)!
        if(start != end){
            tree[node]!.0 = search(start: start, end: index - 1)
            tree[node]!.1 = search(start: index + 1, end: end)
        }
        return node
    }

    let root = search(start: 0, end: n - 1)

    var result = ""
    func postorder(node: Int){
        if node == 0 { return }
        let childs = tree[node]!
        postorder(node: childs.0)
        postorder(node: childs.1)
        result.write("\(node) ")
    }
    postorder(node: root)
    ans.append(result)
}

ans.forEach{
    print($0)
}
