//
//  summaryNotes.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 12.06.2026.
//

import Foundation

class SummaryNotes {
    private(set) var notes: [Note] // хранилище!
    
    init(notes: [Note]) {
        self.notes = notes
    }
    
    func add(topic: String, note: String) { // прими строку
        let date = Date()
        let newNote = Note(topic: topic, note: note, date: date) // создай новую заметку
        notes.append(newNote) // добавь ее в массив
    }
    
    func list() { // печатает все записи в формате: 1. Тема: заметка
        if notes.isEmpty {
            print("No entry")
            return
        }
        for (index, newNotes) in notes.enumerated() {
            print("\(index + 1). \(newNotes.topic)")
            print("\(newNotes.note)")
        }
    }
    func today() { // печатает записи, у которых date сегодняшняя
        let notesToday = notes.filter { Calendar.current.isDateInToday($0.date) }
        if notesToday.isEmpty {
            print("No notes today")
            return
        }
        
        let formatted = DateFormatter()
        formatted.dateFormat = "yyyy-MM-dd"
        let todayString = formatted.string(from: Date())
        for (index, newNote) in notesToday.enumerated() {
            let dateString = formatted.string(from: newNote.date)


            print("\n📅 Сегодняшние записи (\(todayString)):")
            for (index, note) in notesToday.enumerated() {
                print("   \(index + 1). 🔤 \(note.topic)")
                print("      📝 \(note.note)")
            }
        }
    }
}
/*
 🚕💨 Уровень: EASY | ✅ Модуль ID: 2️⃣

 📝 LearningTrack: заметки по основам Swift (тема + заметка). Команды: new, list, today, quit
 📅 Сегодняшние записи (2026-06-12):
    1. 🔤 DateFormatted
       📝 Used for convenient/standard date output. Format "yyyy-MM-dd". Will be useful in any project with dates.
 */
