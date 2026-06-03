//
//  mainNew.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 02.06.2026.
//

import Foundation 

func main() {
    let arguments = CommandLine.arguments
    
    guard arguments.count > 2 else { //arguments[0] — имя программы (./thoughtful), arguments[1] — уровень (easy), arguments[2] — номер модуля (1)
        print("""
    🧠 ThoughtfulSwift — осмысленное программирование
    
    Usage: thoughtful <level> <number> // 
    ✅ Usage — это "Как использовать" (инструкция по запуску)."Чтобы запустить программу, напиши thoughtful, затем уровень (easy), затем номер модуля (1)." Usage: = "Правильный способ вызвать программу"
    
    Levels:
      easy     - Easy modules (1-7)
      medium   - Medium modules (in progress)
      hard     - Hard modules (in progress)
    
    Examples:
      thoughtful easy 1      → ToDo Tracker
      thoughtful easy 2      → Leap Year
      thoughtful easy 3      → Multiplication Table
      thoughtful easy 4      → Array Stats
      thoughtful easy 5      → Palindrome
      thoughtful easy 6      → Reverse String
      thoughtful easy 7      → Sum of Digits
    """)
        exit(1) // жестко — завершает всю программу
    }
    
    let levelName = arguments[1].lowercased() //  1 — уровень
    let taskId = arguments[2] // Индексы — это позиция в массиве аргументов: 2 — номер модуля
    
    guard let level = DifficultyLevel(rawValue: levelName) else { // DifficultyLevel — это enum с кейсами easy, medium, hard DifficultyLevel(rawValue: levelName) — попытка создать enum из строки. Если строка "easy" → получим .easy, если "hello" → nil
        print("❌ Unknown level: \(levelName)") // если нет (nil) → выводим ошибку и выходим
        print("Available levels: easy, medium, hard, fixMistakes") // если enum создался → идём дальше
        exit(1)
    }
    
    guard let task = level.tasks.first(where: { $0.id == taskId }) else { // массив всех задач данного уровня (например, [CurrencyConverterTask, LeapYearTask, ...]) + .first(where: ...)    найти первый элемент, который подходит под условие + $0.id == taskId }    условие: у задачи ($0) свойство id равно taskId ("1", "2", ...) 👉 Простыми словами: «Найди задачу с номером, который ввёл пользователь»
        print("❌ Task with id '\(taskId)' not found in '\(levelName)' level")
        exit(1)
    }
    
    // 🔢 Преобразуем номер в эмодзи (для цифр 1-9)
    if let number = Int(taskId), (1...9).contains(number) { // Int(taskId) — попытка превратить строку "1" в число 1. Если не число → nil.if let — если число получилось, кладём его в константу number (1...9).contains(number) — проверяем, что число от 1 до 9 (для эмодзи 1️⃣–9️⃣) 👉 Безопасно, потому что не крашится, если taskId — не число.
        let numberEmoji = ["1": "1️⃣", "2": "2️⃣", "3": "3️⃣", "4": "4️⃣", "5": "5️⃣", "6": "6️⃣", "7": "7️⃣", "8": "8️⃣", "9": "9️⃣"]
        let emojiId = numberEmoji[taskId] ?? taskId
        print("\n🚕💨 Уровень: \(levelName.uppercased()) | ✅ Модуль ID: \(emojiId)\n")
    } else {
        print("\n🚕💨 Уровень: \(levelName.uppercased()) | ✅ Модуль ID: \(taskId)\n")
    }
    
    task.run()
}

main()
