//
//  main.swift
//  0908
//
//  Created by 조윤영 on 2021/09/08.
//
import Foundation
func cutString(_ s: String, by size: Int) -> Int {
    var i: Int = 0
    var cnt: Int = 1
    var prevWord: String = ""
    var result: String = ""

    while(i < s.count) {
        let upperBound = i + size > s.count ? s.count : i + size
        let range = s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: upperBound)
        let cutWord = String(s[range])

        if cutWord == prevWord { cnt += 1 }
        else if cutWord != prevWord && cnt != 1 {
            result += String(cnt)
            result += prevWord
            cnt = 1
        } else if cutWord != prevWord && cnt == 1 { result += prevWord }

        if i + size > s.count - 1 {
            if cnt != 1 { result += String(cnt) }
            result += cutWord
        }

        prevWord = cutWord
        i += size
    }

    return result.count
}

func solution(_ s:String) -> Int {
    var answer: Int = 1000
    guard s.count != 1 else { return 1 }

    for size in 1...s.count / 2 {
        let compressedStringSize: Int =  cutString(s, by: size)
        answer = compressedStringSize < answer ? compressedStringSize : answer
    }

    return answer
}

let s = "aabbaccc"
print(solution(s))
