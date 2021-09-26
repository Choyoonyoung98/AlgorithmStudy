//
//  main.swift
//  0915
//
//  Created by 조윤영 on 2021/09/08.
//
//
//  main.swift
//  0915
//
//  Created by 조윤영 on 2021/09/15.
//
import Foundation
let Lock = 0
let UNLOCK = 1

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let N = key.count
    let M = lock.count
    
    var extendedLock = [[Int]](repeating: [Int](repeating: 0, count: 3 * M), count: 3 * M)
    
    if (lock.filter{ $0.contains(Lock)}).isEmpty { return true }
    
    for i in 0..<M {
        for j in 0..<M {
            extendedLock[i + M][j + M] = lock[i][j]
        }
    }
    
    var cpy_key = key
    var cpy_extendedLock = extendedLock
    
    for _ in 0..<4 {
        for i in M - N + 1..<2 * M {
            for j in M - N + 1..<2 * M {
                cpy_extendedLock = extendedLock
                for row in 0..<N {
                    for col in 0..<N {
                        cpy_extendedLock[i + row][j + col] += cpy_key[row][col]
                    }
                }
                
                if canUnLock(cpy_extendedLock) { return true }
            }
        }
        cpy_key = rotate(cpy_key)
    }
    return false
}

func rotate(_ key: [[Int]]) -> [[Int]] {
    let N = key.count
    var rotatedKey = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    for i in 0..<N {
        for j in (0..<N).reversed() {
            rotatedKey[i][N - 1 - j] = key[j][i]
        }
    }
    
    return rotatedKey
}

func canUnLock(_ lock: [[Int]]) -> Bool {
    let M = lock.count
    for i in M..<M * 2 {
        for j in M..<M * 2 {
            if lock[i][j] != UNLOCK { return false }
        }
    }
    
    return true
}
