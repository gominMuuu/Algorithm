//
//  Combination.swift
//  Algorithm
//
//  Created by 박소윤 on 2023/03/14.
//

import Foundation

func combination<T>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }

    cycle(0,[])

    return result
}
