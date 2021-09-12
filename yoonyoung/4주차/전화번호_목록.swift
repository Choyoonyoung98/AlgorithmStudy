//
//  main.swift
//  0908
//
//  Created by 조윤영 on 2021/09/08.
//
import Foundation
func solution(_ phone_book: [String]) -> Bool {
    let sorted_phone_book = phone_book.sorted()
    
    for (index, phoneNumb) in sorted_phone_book.enumerated() {
        guard index > 0 else { continue }
        let prevPhoneNumb = sorted_phone_book[index - 1]
        if prevPhoneNumb == phoneNumb.prefix(prevPhoneNumb.count) { return false }
    }
    return true
}

let phone_book = ["119", "97674223", "1195524421"]
print(solution(phone_book))
