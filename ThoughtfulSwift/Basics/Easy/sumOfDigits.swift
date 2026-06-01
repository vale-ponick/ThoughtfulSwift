//
//  sumOfDigits.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 01.06.2026.
//

import Foundation

// MARK: - SumOfDigits

/* SumOfDigits: Что нужно сделать:
  
    Пройти по каждому символу, преобразовать в Int и сложить
    Если введено не число — сообщить об ошибке
    
 */

func runSumOfDigits() {
    while true {
        print("Enter a number (or 'quit'): ", terminator: "")
        
        guard let input = readLine()?
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
        else { continue }
        
        if input == "quit" {
            print("By, vale")
            break
        }
        
        var sum = 0
        var isValid = true
        
        for char in input {
            if let num = Int(String(char)) {
                sum += num
            } else {
                print("❌ '\(char)' is not a digit")
                isValid = false
                break
            }
        }
        if isValid {
            print("✅ Sum of digits: \(sum)")
        }
    }
}
/* Выберите модуль: 1 - Currency, 2 - LeapYear, 3 - MultiplicationTable, 4 - ArrayStats, 5 - Palindrome, 6 - ReverseString, 7 - SumOfDigits
 7
 Enter a number (or 'quit'): 1221
 ✅ Sum of digits: 6
 Enter a number (or 'quit'): 33333
 ✅ Sum of digits: 15
 Enter a number (or 'quit'): quit
 ❌ 'й' is not a digit
 Enter a number (or 'quit'): quit
 By, vale
 Program ended with exit code: 0 */
