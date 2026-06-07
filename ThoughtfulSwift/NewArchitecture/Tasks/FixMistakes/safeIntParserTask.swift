//
//  safeIntParserTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 07.06.2026.
//

import Foundation

//MARK: - 📝 SafeIntParserTask

struct SafeIntParserTask: ExecutableTask {
    let id = "fix8"
    
    func run() {
        print("📝 SafeIntParserTask - using  guard let + if let")
        print("Enter a number: ", terminator: "")
        
        guard let input = readLine()?.trimmingCharacters(in: .whitespaces) else {
            print("No input")
            return
        }
        if let inputNumber = Int(input) {
            print("✅ Number: \(inputNumber)")
        } else {
            print("❌ Invalid number")
        }
    }
}
/*
 🚕💨 Уровень: FIXMISTAKES | ✅ Модуль ID: fix8

 📝 SafeIntParserTask
 Enter a number: 12
 ✅ Number: 12
 Program ended with exit code: 0 */

