//
//  main.swift
//  0925
//
//  Created by 조윤영 on 2021/09/25.
//

func solution(_ nums: [Int], _ target: Int) -> [Int] {
    var answer: [Int] = []
    
    var dict: [Int: Int] = [:]
    for (idx, num) in nums.enumerated() {
        if let matchNum = dict[target - num] { return [idx, matchNum] }
        dict[num] = idx
    }
    
    return answer
}

let nums = [3, 2, 4]
let target = 6
print(solution(nums, target))
