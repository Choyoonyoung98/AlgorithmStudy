//
//  main.swift
//  0926
//
//  Created by 조윤영 on 2021/09/26.
//

import Foundation

var answer: [Int] = []
func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var map: [String: Int] = [:]
    for (idx, genre) in genres.enumerated() {
        if map[genre] == nil { map[genre] = plays[idx] }
        else { map[genre]! += plays[idx] }
    }

    var info: [(genre: String, sum: Int, playCnt: Int, idx: Int)] = []
    for (index, genre) in genres.enumerated() {
        info.append((genre: genre, sum: map[genre]!, playCnt: plays[index], idx: index))
    }

    info.sort(by: {
        if $0.sum == $1.sum {
            if $0.playCnt == $1.playCnt {
                return $0.idx < $1.idx
            } else { return $0.playCnt > $1.playCnt }
        }
        return $0.sum > $1.sum
    })

    var cnt = 0
    var prevGenre = ""
    for i in info {
        if prevGenre != i.genre {
            prevGenre = i.genre
            cnt = 1
        } else { cnt += 1 }

        if cnt > 2 { continue }
        answer.append(i.idx)
    }

    return answer
}

let genres = ["classic", "pop", "classic", "classic", "pop"]
let plays = [500, 600, 150, 800, 2500]
print(solution(genres, plays))
