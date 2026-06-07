//
//  enumeratedDemoTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 07.06.2026.
//

import Foundation

// MARK: - EnumeratedDemoTask

struct EnumeratedDemoTask: ExecutableTask {
    let id = "fix10"
    
    func run() {
       print("EnumeratedDemoTask - using enumerated()")
        
       let words = ["Swift", "iOS", "macOS", "watchOS"]
        for(index, word) in words.enumerated() {
            print("\(index + 1). \(word)")
        }
    }
}
/* 🚕💨 Уровень: FIXMISTAKES | ✅ Модуль ID: fix10
 
 EnumeratedDemoTask - using enumerated()
 1. Swift
 2. iOS
 3. macOS
 4. watchOS
 Program ended with exit code: 0
*/
