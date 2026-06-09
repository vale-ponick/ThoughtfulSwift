//
//  toDoTrackerProTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 08.06.2026.
//

import Foundation

struct ToDoTrackerTask: ExecutableTask {
    let id = "1"
    
    func run() {
        let manager = TaskManager()
        manager.load()
        
        print("📋 ToDoTrackerPro — управление задачами")
        
        while true {
        print("\nCommands: add, list, done, delete, save, load, quit")
        print("> ", terminator: "") // "> -> "Программа ждёт вашего ввода"
            
        guard let input = readLine()?.lowercased() else { continue }
            guard let command = Command(rawValue: input) else {
                print("Uncnown command")
                continue
            }
            
            switch command {
            case .add:
                print("Task title: ", terminator: "")
                guard let title = readLine(), !title.isEmpty else {
                    print("❌ Empty title")
                    continue
                }
                manager.add(title: title)
                print("✅ Added: \(title)")
                
            case .list:
                manager.list()
                
            case .done:
                print("Task number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                if manager.done(at: num) {
                    print("✅ Task completed")
                } else {
                    print("❌ Invalid number")
                }
                
            case .delete:
                print("Task number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                if manager.delete(at: num) {
                    print("🗑️ Task deleted")
                } else {
                    print("❌ Invalid number")
                }
                
            case .save:
                manager.save()
                
            case .load:
                manager.load()
                
            case .exit:
                manager.save()
                print("By, vale")
                return
            }
        }
    }
}

/* ТЗ:
 
 Структура ToDoTrackerProTask: ExecutableTask

 id = "1" (уровень .medium)

 В run() создать TaskManager

 Цикл while true

 Меню с командами (, done, , save, load, )

 Использовать Command enum*/
