//
//  main.swift
//  0915
//
//  Created by 조윤영 on 2021/09/08.
//
import Foundation

var N = 0
var M = 0
var board: [[Int]] = []
var chickens: [(y: Int, x: Int)] = []
var houses: [(y: Int, x: Int)] = []
var answer: Int = 5000

func input() {
    let inputList = readLine()!.split(separator: " ").map{ Int($0)! }
    N = inputList[0]
    M = inputList[1]
    for _ in 0..<N {
        board.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    
    for i in 0..<N {
        for j in 0..<N {
            if board[i][j] == 2 { chickens.append((y: i, x: j))}
            else if board[i][j] == 1 { houses.append((y: i, x: j))}
        }
    }
}

func solution() {
    selectChickenHouse(0, selected_chickens: [])
    print(answer)
}

func selectChickenHouse(_ idx: Int, selected_chickens: [(y: Int, x: Int)]) {
    if selected_chickens.count == M {
        //도시의 치킨 거리 계산
        var sum = 0
        for house in houses {
            var chickenDistance = 100
            for chicken in selected_chickens {
                let distance = abs(house.y - chicken.y) + abs(house.x - chicken.x)
                chickenDistance = min(chickenDistance, distance)
            }
            sum += chickenDistance
        }
        
        answer = min(answer, sum)
        return
    }
    
    guard idx < chickens.count else { return }
    
    var new_selected_chickens = selected_chickens
    for i in idx..<chickens.count {
        new_selected_chickens.append((y: chickens[i].y, x: chickens[i].x))
        selectChickenHouse(i+1, selected_chickens: new_selected_chickens)
        new_selected_chickens.removeLast()
    }
}

input()
solution()
