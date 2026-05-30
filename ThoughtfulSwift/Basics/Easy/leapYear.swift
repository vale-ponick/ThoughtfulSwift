//
//  leapYear.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 30.05.2026.
//

import Foundation

// MARK: - LeapYear (Easy)

/* "Запросить у пользователя год - 'Введите год:', Прочитать строку через readLine(), Преобразовать в Int, Проверить, високосный ли год" */

func runLeapYear() {
    while true {
        print("Enter the year: ", terminator: "")
        
        guard let input = readLine() else { continue }
        
        let trimmed = input.lowercased().trimmingCharacters(in: .whitespaces)
        if trimmed == "quit" {
            print("By, vale.ponick!")
            break
        }
        
        guard let year = Int(input), year > 0 else {
            print("❌ Invalid year")
            continue
        }
            
        let isLeap = year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
             print(isLeap ? "✅ Leap year" : "❌ Not leap year")
         }
}
/*
 Выберите модуль: 1 - Currency, 2 - LeapYear
 2
 Enter the year: 2000
 ✅ Leap year
 Enter the year: quit
 By, vale.ponick!
 */
