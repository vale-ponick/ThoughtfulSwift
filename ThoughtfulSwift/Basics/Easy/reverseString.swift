//
//  reverseString.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 31.05.2026.
//

import Foundation

// MARK: - ReverseString

/* ReverseString - Написать переворот строки без использования .reversed() -> тренируй индексы и циклы.
Что нужно сделать:
  
    Пройти по индексам от последнего до первого
    Собрать символы в новую строку (var result = "", result.append(...))
 Вывод: "Reversed: \(result)"
 */

func runReverseString() {
    while true {
        print("Enter a word (or 'quit'): ", terminator: "")
        
        guard let input = readLine() else { continue }
        
        let cmd = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
        
        if cmd == "quit" {
            print("By, vale.ponick")
            break
        }
        
        let arrayStr = Array(cmd)
        
        var reversedStr = ""
        
        for index in stride(from: arrayStr.count - 1, through: 0, by: -1) {
            reversedStr.append(arrayStr[index]) // Добавляем символ в конец нашей новой строки
        }
        print("Reversed: \(reversedStr)")
    }
}
