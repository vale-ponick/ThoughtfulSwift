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
