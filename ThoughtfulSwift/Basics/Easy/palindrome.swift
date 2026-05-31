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
        print("Enter word/frase: ", terminator: " ")
        guard let input = readLine() else { continue }
        
        let trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "")
        
        if trimmed == "quit" {
            print("By, vale")
            break
        }
        let process = trimmed.lowercased()
        let isPalindrome = (process == String(process.reversed()))
        print(isPalindrome ? "✅ Palindrome" : "❌ Not palindrome")
    }
}
