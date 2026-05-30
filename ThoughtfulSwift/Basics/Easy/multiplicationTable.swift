//
//  multiplicationTable.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 31.05.2026.
//

import Foundation

func  runMultiplicationTable() {
    while true {
        print("Enter a number: ", terminator: "")
        
        guard let input = readLine() else { continue }
        
        let trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed == "quit" {
            print("By, vale")
            break
        }
        guard let number = Int(trimmed), number > 0 else {
            print("❌ Invalid number")
            continue
        }
        for i in 1...10 {
            print("\(number) * \(i) = \(number * i)")
        }
    }
}
