//
//  main.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 29.05.2026.
//

import Foundation

// Запуск:
print("Выберите модуль: 1 - Currency, 2 - LeapYear, 3 - MultiplicationTable, 4 - ArrayStats, 5 - Palindrome")

if let choice = readLine() {
    switch choice {
    case "1":
        runCurrencyConverter()
    case "2":
        runLeapYear()
    case "3":
        runMultiplicationTable()
    case "4":
        runArrayStats()
    case "5":
        runPalindrome()
    default:
        print("❌ Неверный выбор")
    }
} else {
    print("❌ Ошибка ввода")
}
  

