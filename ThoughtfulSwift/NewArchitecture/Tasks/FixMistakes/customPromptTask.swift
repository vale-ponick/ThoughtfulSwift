//
//  customPromptTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 07.06.2026.
//

import Foundation

struct CustomPromptTask: ExecutableTask {
    let id = "fix9"
    
    func run() {
        print("📝 CustomPromptTask - using print(..., terminator: '') ")
        print("👉 (enter your name): ", terminator: "")
        
        guard let input = readLine()?.trimmingCharacters(in: .whitespaces).lowercased() else {
            print("No input")
            return
        }
        
        guard !input.isEmpty else {
            print("Input cannot be empty")
            return
        }
        print("Hello, \(input)!")
    }
}

/*
 🚕💨 Уровень: FIXMISTAKES | ✅ Модуль ID: fix9

 📝 CustomPromptTask - using print(..., terminator: '')
 👉 (enter your name): vale.ponick
 Hello, vale.ponick!
 Program ended with exit code: 0
 */
