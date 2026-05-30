//
//  arrayStats.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 31.05.2026.
//

import Foundation

// MARK: - ArrayStats

/* Запросить 5 чисел через пробел: 'Enter 5 numbers (e.g. 1 2 3 4 5): ', Разбить строку: .split(separator: " "), Преобразовать в [Int]. Найти сумму, минимум, максимум. Выход по quit */

func runArrayStats() {
    while true {
        print("Enter 5 numbers(e.g. 1 2 3 4 5: ", terminator: " ")
        
        guard let input = readLine() else { continue }
        let trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmed == "quit" {
            print("By, vale")
            break
        }
            
        let numsArray = trimmed.split(separator: " ")
        let targetNums = numsArray.compactMap { Int($0) }
        guard targetNums.count == 5 else {
            print("Needed 5 numbers")
            continue }

        let sum = targetNums.reduce(0, +)
        let min = targetNums.min() ?? 0
        let max = targetNums.max() ?? 0
        
        print("Sum: \(sum), Min: \(min), Max: \(max)")
    }
}
