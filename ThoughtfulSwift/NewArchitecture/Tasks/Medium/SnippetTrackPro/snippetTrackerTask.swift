//
//  snippetTrackerTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 12.06.2026.
//

import Foundation

// MARK: - SnippetTrackPro

struct SnippetTrackerTask: ExecutableTask {
    let id = "2"
    
    func run() {
        let snippetStore = SnippetStore()
        
        print("📋 SnippetTrackPro — подборка сниппетов")
        
        while true {
            print("\nCommands: new, list, today, save, load, delete, quit")
            print("> ", terminator: "")
            
            guard let input = readLine()?.lowercased().trimmingCharacters(in: .whitespaces) else { continue }
            
            switch input {
            case "new":
                print("Title: ", terminator: "")
                guard let title = readLine(), !title.isEmpty else { continue }
                print("Code: ", terminator: "")
                guard let code = readLine(), !code.isEmpty else { continue }
                print("Note: ", terminator: "")
                guard let note = readLine(), !note.isEmpty else { continue }
                snippetStore.addSnippet(title: title, code: code, note: note)
                print("✅ Added snippet: \(title)")   // ← ТОЛЬКО ЗДЕСЬ
                
            case "list":
                snippetStore.list()
                
            case "today":
                snippetStore.today()
                
            case "save":
                snippetStore.save()
                
            case "load":
                snippetStore.load()
                
            case "quit":
                snippetStore.save()
                print("By, vale.ponick!")
                return
                
            case "delete":
                print("Enter number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                if snippetStore.delete(at: num) {
                    print("🗑️ Deleted")
                } else {
                    print("❌ Invalid number")
                }
                
            default:
                print("❌ Unknown command")
            }
        }
    }
}
     
