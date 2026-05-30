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
        
        if input.lowercased() == "quit" {
            print("👋 Goodbye!")
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
