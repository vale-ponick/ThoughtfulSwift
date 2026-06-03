//
//  toDoManager.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 02.06.2026.
//

import Foundation

// MARK: - ToDoTracker

struct ToDoTracker: ExecutableTask { // используй протокол с параметром id(номер порядковый) + И его можно только читать (get), но нельзя менять (set)
    let id = "1"
    
    func run() {
        print("📋 ToDoTracker — управление задачами")
        
        var tasks: [String] = []
        
        while true {
            print("\nCommands: add, list, delete, quit")
            print("> ", terminator: "") // "> -> "Программа ждёт вашего ввода"
            
            guard let input = readLine()?.lowercased() else { continue }
            
            switch input {
            case "quit":
                print("By, vale")
                return
            case "add":
                print("Task title: ", terminator: "")
                guard let title = readLine(), !title.isEmpty else {
                    print("❌ Empty title")
                    continue
                }
                tasks.append(title)
                print("✅ Added: \(title)")
            case "list":
                if tasks.isEmpty {
                    print("📭 No tasks")
                } else {
                    for (index, task) in tasks.enumerated() { // 👉  enumerated() превращает массив в пронумерованный список. Каждый элемент получает порядковый номер (index) и само значение (task).
                        print("\(index + 1). \(task)")
                    }
                }
            case "delete":
                print("Task number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr), (1...tasks.count).contains(num) else { //👉 Зачем: Если tasks.count = 3, то (1...3).contains(5) → false (нельзя удалить 5-ю задачу).
                    print("❌ Invalid number")
                    continue
                }
                let removed = tasks.remove(at: num - 1) // remove(at:) удаляет элемент по индексу и возвращает его.
                print("🗑️ Deleted: \(removed)")
            default:
                print("❌ Unknown command")
            }
        }
    }
}

