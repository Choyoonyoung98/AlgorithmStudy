//
//  main.swift
//  0925
//
//  Created by 조윤영 on 2021/09/25.
//

import Foundation

var board: [[[Bool]]] = []
var answer: [[Int]] = []
var frames: [(y: Int, x: Int, type: String)] = []

//0번째: 기둥 설치 여부, 1번째: 보 설치 여부
func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    board = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 2), count: n+1), count: n+1)

    for frame in build_frame {
        let x = frame[0]
        let y = n - frame[1]
        let type = frame[2]
        let action = frame[3]

        if action == 0 { deleteRelatedFrame(y, x, type) }
        else { installFrame(y, x, type) }
    }

    makeResult()

    print(answer)
    return answer
}

func makeResult() {
    for j in 0..<board.count {
        for i in (0..<board.count).reversed() {
            if board[i][j][0] == true { answer.append([j, board.count - i - 1, 0]) }
            if board[i][j][1] == true { answer.append([j, board.count - i - 1, 1])}
        }
    }
}

func deleteRelatedFrame(_ y: Int, _ x: Int, _ type: Int) {
    board[y][x][type] = false
    if type == 0 { if !deleteRelatedToVerticalObject(y, x) { board[y][x][type] = true }}
    else { if !deleteRelatedToHorizontalObject(y, x) { board[y][x][type] = true }}
}

func deleteRelatedToVerticalObject(_ y: Int, _ x: Int) -> Bool { //기둥 관련 설치 삭제
    if isInBoundary(y-1, x) && board[y-1][x][1] == true && !isHorizontalObjectCanInstall(y-1, x) { return false }
    if isInBoundary(y-1, x-1) && board[y-1][x-1][1] == true && !isHorizontalObjectCanInstall(y-1, x-1) { return false }
    if isInBoundary(y-1, x) && board[y-1][x][0] == true && !isVerticalObejctCanInstall(y-1, x) { return false }

    return true
}

func deleteRelatedToHorizontalObject(_ y: Int, _ x: Int) -> Bool { //보 관련 설치 삭제
    if isInBoundary(y, x-1) && board[y][x-1][1] == true && !isHorizontalObjectCanInstall(y, x-1) { return false }
    if isInBoundary(y, x+1) && board[y][x+1][1] == true && !isHorizontalObjectCanInstall(y, x+1) { return false }
    if board[y][x][0] == true && !isVerticalObejctCanInstall(y, x) { return false }
    if isInBoundary(y, x+1) && board[y][x+1][0] == true && !isVerticalObejctCanInstall(y-1, x+1) { return false }

    return true
}

func installFrame(_ y: Int, _ x: Int, _ type: Int) {
    if type == 0 && isVerticalObejctCanInstall(y, x) { board[y][x][0] = true }
    else if type == 1 && isHorizontalObjectCanInstall(y, x) { board[y][x][1] = true }
}

func isVerticalObejctCanInstall(_ y: Int, _ x: Int) -> Bool {
    //바닥 위에 있거나 보의 한쪽 끝 부분 위에 있거나, 또는 다른 기둥 위에 있을 경우
    if y == board.count - 1 { return true }
    if y + 1 < board.count && board[y+1][x][0] == true { return true }
    if x - 1 >= 0 && (board[y][x-1][1] == true || board[y][x][1] == true) { return true }
    return false
}

func isHorizontalObjectCanInstall(_ y: Int, _ x: Int) -> Bool {
    if y + 1 < board.count && board[y+1][x][0] == true { return true }
    if y + 1 < board.count && x + 1 < board.count && board[y+1][x+1][0] == true { return true }
    if x - 1 >= 0 && x + 1 < board.count && board[y][x-1][1] == true && board[y][x+1][1] == true { return true }
    return false
}

func isInBoundary(_ y: Int, _ x: Int) -> Bool {
    if 0 <= y && y < board.count && 0 <= x && x < board.count { return true }
    return false
}


let n = 5
let build_frame = [[1,0,0,1],[1,1,1,1],[1, 1, 0, 1], [2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]

solution(n, build_frame)

func printBoard() {
    for b in board {
        print(b)
    }
    print("======================")
}
