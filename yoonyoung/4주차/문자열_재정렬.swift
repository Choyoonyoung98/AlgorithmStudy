//
//  main.swift
//  0908
//
//  Created by 조윤영 on 2021/09/08.
//
import Foundation
func solution(_ word: String) -> String {
    var answer = ""
    let sorted_word = word.sorted()
    
    var sum = 0
    for w in sorted_word {
        if w.isNumber { sum += Int(String(w))! }
        else { answer += String(w) }
    }
    
    answer += String(sum)
    return answer
}

print(solution("K1KA5CB7"))
