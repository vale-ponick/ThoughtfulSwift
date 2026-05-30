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
        print("Enter the year: ")
        
        guard let input = readLine(), !input.isEmpty else {
            print("Error, enter year: ")
            continue
        }
        guard let validInput = Int(input) else {
            print("Error, not a number")
            continue
        }
        if (validInput) % 4 == 0, (validInput) % 100 != 0 || (validInput) % 400 == 0 {
            print("\(validInput) - leap year")
        } else {
            print("\(validInput) - not leap year")
        }
        print("Enter next year? (y/n): ")
        
        if let answer = readLine(), answer.lowercased() == "yes" || answer.lowercased() == "y" {
            continue
        } else {
            break
        }
    }
}
