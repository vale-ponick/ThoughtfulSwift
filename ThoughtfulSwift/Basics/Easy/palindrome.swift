//
//  palindrome.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 31.05.2026.
//

import Foundation

//MARK: - Palindrome

/* Запросить слово или фразу, Выход по quit, Привести к нижнему регистру .lowercased(), Удалить все пробелы .replacingOccurrences(of: " ", with: ""), Проверить, читается ли одинаково: сравнить строку с её разворотом String(s.reversed()). Вывести результат: "✅ Палиндром" или "❌ Не палиндром"*/

func runPalindrome() {
    while true {
        print("Enter word/frase (or 'quit'): ", terminator: " ")
        guard let input = readLine()? // → Optional String
            .trimmingCharacters(in: .whitespacesAndNewlines)  // → убирает пробелы по краям
            .replacingOccurrences(of: " ", with: "") else { // → убирает пробелы внутри
            continue // → если на любом шаге nil — continue
        }
        
        if input == "quit" {
            print("By, vale")
            break
        }
    
        print(input == String(input.reversed()) ? "✅ Palindrome" : "❌ Not palindrome")
    }
}
