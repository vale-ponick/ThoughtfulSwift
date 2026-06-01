//
//  mainNew.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 02.06.2026.
//

import Foundation 

func main() {
    let arguments = CommandLine.arguments
    
    guard arguments.count > 2 else {
        print("""
    🧠 ThoughtfulSwift — осмысленное программирование
    
    Usage: thoughtful <level> <number>
    
    Levels:
      easy     - Easy modules (1-7)
      medium   - Medium modules (in progress)
      hard     - Hard modules (in progress)
    
    Examples:
      thoughtful easy 1      → ToDoTracker
      thoughtful easy 2      → Leap Year
      thoughtful easy 3      → Multiplication Table
      thoughtful easy 4      → Array Stats
      thoughtful easy 5      → Palindrome
      thoughtful easy 6      → Reverse String
      thoughtful easy 7      → Sum of Digits
    """)
        exit(1)
    }
    
    let levelName = arguments[1].lowercased()
    let taskId = arguments[2]
    
    guard let level = DifficultyLevel(rawValue: levelName) else {
        print("❌ Unknown level: \(levelName)")
        print("Available levels: easy, medium, hard")
        exit(1)
    }
    
    guard let task = level.tasks.first(where: { $0.id == taskId }) else {
        print("❌ Task with id '\(taskId)' not found in '\(levelName)' level")
        exit(1)
    }
    
    // 🔢 Преобразуем номер в эмодзи (для цифр 1-9)
    if let number = Int(taskId), (1...9).contains(number) {
        let numberEmoji = ["1": "1️⃣", "2": "2️⃣", "3": "3️⃣", "4": "4️⃣", "5": "5️⃣", "6": "6️⃣", "7": "7️⃣", "8": "8️⃣", "9": "9️⃣"]
        let emojiId = numberEmoji[taskId] ?? taskId
        print("\n🚕💨 Уровень: \(levelName.uppercased()) | ✅ Модуль ID: \(emojiId)\n")
    } else {
        print("\n🚕💨 Уровень: \(levelName.uppercased()) | ✅ Модуль ID: \(taskId)\n")
    }
    
    task.run()
}

main()
