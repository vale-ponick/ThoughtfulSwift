//
//  learningTrackCLI.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 12.06.2026.
//

import Foundation

struct LearningTrackTask: ExecutableTask {
    let id = "2"
    
    func run() {
        print("📝 LearningTrack: заметки по основам Swift (тема + заметка). Команды: new, list, today, export, quit")
        
        let learningNote = SummaryNotes(notes: [])
        
        while true {
            print("\nCommands: new, list, today, export, quit")
            print("> ", terminator: "")
            
            guard let note = readLine()?.lowercased() else { continue }
            
            switch note {
            case "new":
                print("Topic: ", terminator: "")
                guard let topic = readLine(), !topic.isEmpty else {
                    print("❌ Empty topic")
                    continue
                }
                print("Note: ", terminator: "")
                guard let note = readLine(), !note.isEmpty else {
                    print("❌ Empty note")
                    continue
                }
                learningNote.add(topic: topic, note: note)
                print("✅ Added")
            case "list":
                learningNote.list()
            case "today":
                learningNote.today()
            case "export":
                learningNote.exportToText()
            case "quit":
                print("By, vale.ponick!")
                return
            default:
                print("❌ Unknown command")
            }
        }
    }
}
