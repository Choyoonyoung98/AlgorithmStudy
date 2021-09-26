//
//  main.swift
//  0915
//
//  Created by 조윤영 on 2021/09/08.
//
import Foundation

var N: Int = 0
var K: Int = 0
var L: Int = 0
var apple = [(y: Int, x: Int)]()
var routes = [(time: Int, dir: String)]()
var board = [[Int]]()
let moveDir: [(y: Int, x: Int)] = [(-1, 0), (0, 1), (1, 0), (0, -1)]
let EMPTY = 0
let BODY = 1
let APPLE = 2

func input() {
    N = Int(readLine()!)!
    K = Int(readLine()!)!
    board = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    
    for _ in 0..<K {
        let inputList = readLine()!.split(separator: " ").map{ Int($0)! }
        let y = inputList[0]
        let x = inputList[1]
        board[y-1][x-1] = APPLE
    }
    
    L = Int(readLine()!)!
    for _ in 0..<L {
        let inputList = readLine()!.split(separator: " ").map{ String($0) }
        let X: Int = Int(inputList[0])!
        let C: String = String(inputList[1])
        
        routes.append((time: X, dir: C))
    }
}

func solution() -> Int {
    var snakeDirection = 1
    var y = 0
    var x = 0
    var time = 0
    var tail: [(y: Int, x: Int)] = [(y: 0, x: 0)]

    while true {

        if !routes.isEmpty && time == routes.first!.time {
            snakeDirection = changeDirection(currentDir: snakeDirection, dirType: routes.first!.dir)
            routes.removeFirst()
        }
        
        
        let nextY = y + moveDir[snakeDirection].y
        let nextX = x + moveDir[snakeDirection].x
        
        guard isInBoundary(nextY, nextX) && hasNoBody(nextY, nextX) else { break }
        y = nextY
        x = nextX
            
        if !hasApple(nextY, nextX) {
            let removeY = tail.first?.y
            let removeX = tail.first?.x
            board[removeY!][removeX!] = 0
            tail.removeFirst() } //가장 마지막 위치에서 꼬리 제거
            
        board[y][x] = BODY
        tail.append((y: y, x: x))
        
        time += 1
    }
    
    return time + 1
}

func changeDirection(currentDir: Int, dirType: String) -> Int {
    if dirType == "L" { return (currentDir + 4 - 1) % 4 } //왼쪽으로 회전
    else { return (currentDir + 1) % 4 } //오른쪽으로 회전
}

func isInBoundary(_ y: Int, _ x: Int) -> Bool {
    if 0 <= y && y < N && 0 <= x && x < N { return true }
    return false
}

func hasNoBody(_ y: Int, _ x: Int) -> Bool {
    if board[y][x] != BODY { return true }
    return false
}

func hasApple(_ y: Int, _ x: Int) -> Bool {
    if board[y][x] == APPLE { return true }
    return false
}

input()
print(solution())
