//
//  main.swift
//  그리디
//
//  Created by 조윤영 on 2021/08/08.
//
//그리디는 현재 상황에서 가장 좋아보이는 것을 선택하는 것이기 때문에
//오름차순이나 내림차순 상황을 만들어서 들어가는 것이 최적의 해를 구하기 적합한 풀이가 된다

import Foundation

func solution1() -> Int {
    var answer = 0
    
    let N = Int(readLine()!)
    var adventurers = readLine()!.split(separator: " ").map{ Int($0)! }
    
    adventurers.sort()
    
    var cnt = 0
    for adventurer in adventurers {
        
        cnt += 1
        if cnt >= adventurer {
            answer += 1
            cnt = 0
        }
    }
    
    return answer
}

//print(solution1())


func solution2() -> String {
    let N = readLine()!
    if N.count <= 1 { return N }
    var answer = ""
    var result: Int = Int("\(N[N.startIndex])")!
    for i in 1..<N.count {
        let strB = N[N.index(N.startIndex, offsetBy: i)]
        let b: Int = Int("\(strB)")!
        
        result = result * b > result + b ? result * b : result + b

    }
    answer = String(result)
    return answer
}

//print(solution2())

let dict = ["A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7, "I": 8, "J": 9, "K": 10, "L": 11, "M": 12, "N": 13, "O": 14, "P": 15, "Q": 16, "R": 17, "S": 18, "T": 19, "U": 20, "V": 21, "W": 22, "X": 23, "Y": 24, "Z": 25]

func solution3(_ name: String) -> Int {
    var answer: Int = 0
    var cnt = name.count - 1

    for i in 0..<name.count {
        var nextIndex = i + 1
        let nextStr = "\(name[name.index(name.startIndex, offsetBy: i)])"
        
        if nextStr != "A" {
            answer += dict[nextStr]! < 25 - dict[nextStr]! + 1 ? dict[nextStr]! : 25 - dict[nextStr]! + 1
        }
        
        while nextIndex < name.count && name[name.index(name.startIndex, offsetBy: nextIndex)] == "A" { nextIndex += 1 }
        
        let reverseFindCnt = i + i + name.count - nextIndex
        cnt = cnt < reverseFindCnt ? cnt : reverseFindCnt
    }
    
    answer += cnt
    return answer
}

//print(solution3("JEROEN"))

func solution4(_ number: String, _ k: Int) -> String {
    var answer = ""
    var s = Stack<Int>()
    var deleteCnt = 0
    var i = 0
    while i < number.count && deleteCnt < k {
        let n = number[number.index(number.startIndex, offsetBy: i)]
        print(n)
        if s.isEmpty {
            s.push(Int("\(n)")!)
            i += 1
            continue
        }
        
        if s.top()! < Int("\(n)")! {
            s.pop()
            deleteCnt += 1
        } else {
            s.push(Int("\(n)")!)
            i += 1 //앞으로
        }
    }
    
    if deleteCnt >= k {
        for j in i..<number.count {
            let n = number[number.index(number.startIndex, offsetBy: j)]
            s.push(Int("\(n)")!)
        }
    }
    
    while !s.isEmpty {
        answer = String(s.top()!) + answer
        s.pop()
    }
    
    if i >= number.count {
        let range = answer.index(answer.startIndex, offsetBy: 0) ... answer.index(answer.endIndex, offsetBy: -1-k)
        answer = String(answer[range])
    }
    
    return answer
}

let number = "4177252841"
let k = 4
print(solution4(number, k))

public struct Stack<T> {
    public init() { }
    internal var data = Array<T>()
    public var isEmpty: Bool { data.isEmpty }
    public func top() -> T? { return data.last }
    public var count: Int { return data.count }
    public mutating func push(_ element: T) { data.append(element) }
    public mutating func pop() { data.removeLast() }
}
