//
//  findUserTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 04.06.2026.
//

import Foundation

// MARK: - FindUserTask

struct FindUserTask: ExecutableTask {
    let id = "fix4"
    
    func run() {
        print("📋 FindUserTask - использование .first(where:)")
        
        let users = [
            (id: "1", name: "Alice"),
            (id: "2", name: "Bob"),
            (id: "3", name: "Vale"),
            (id: "4", name: "Ann")
        ]
        print("Enter your id: ", terminator: "")
        
        guard let inputID = readLine()?.lowercased() else {
            print("❌ No input")
            return
        }
        if let userName = users.first(where: { $0.id == inputID }) {
            print("Name: \(userName.name)")
        } else {
            print("User not found")
        }
    }
}
/*
 🚕💨 Уровень: FIXMISTAKES | ✅ Модуль ID: fix4

 📋 FindUserTask - использование .first(where:)
 Enter your id: 3
 Name: Vale
 */
