//
//  main.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 14.06.2026.
//

import Foundation

func main() {
    setbuf(stdout, nil)
    print("DEBUG: main() started")
    let arguments = CommandLine.arguments
    
    guard arguments.count > 2 else {
        print("""
🧠 ThoughtfulSwift — осмысленное программирование

Usage: thoughtful <level> <number>

Levels:
  easy     - Easy modules (1-7)
  medium   - Medium modules (1-2)
  hard     - Hard modules (in progress)

Examples:
  thoughtful easy 1      → ToDoTracker
  thoughtful medium 2    → SnippetTracker
""")
        exit(1)
    }
    
    let levelName = arguments[1].lowercased()
    let taskId = arguments[2]
    
    guard let level = DifficultyLevel(rawValue: levelName) else {
        print("❌ Unknown level: \(levelName)")
        print("Available levels: easy, medium, hard, fixmistakes")
        exit(1)
    }
    
    guard let task = level.tasks.first(where: { $0.id == taskId }) else {
        print("❌ Task with id '\(taskId)' not found in '\(levelName)' level")
        exit(1)
    }
    
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
