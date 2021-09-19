//
//  main.swift
//  0915
//
//  Created by 조윤영 on 2021/09/08.
//
import Foundation

//조합 공식을 이용한 풀이
func solution(_ clothes:[[String]]) -> Int {
    var answer = 1
    var map: [String: Int] = [:]
    
    for clothing in clothes {
        let type: String = clothing[1]
        if map[type] == nil { map[type] = 1 }
        else { map[type]! += 1 }
    }
    
    for m in map { answer *= (m.value + 1) }
    
    return answer - 1
}

let clothes = [["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]
print(solution(clothes))
