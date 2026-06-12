//
//  summaryNotes.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 12.06.2026.
//

import Foundation

class SummaryNotes {
    private(set) var entries: [Entry] // хранилище!
    
    init(entries: [Entry]) {
        self.entries = entries
    }
    
    func add(topic: String, note: String) { // прими строку
        let date = Date()
        let newEntry = Entry(topic: topic, note: note, date: date) // создай новую заметку
        entries.append(newEntry) // добавь ее в массив
    }
    
    func list() { // печатает все записи в формате: 1. Тема: заметка
        if entries.isEmpty {
            print("No entry")
            return
        }
        for (index, newEntry) in entries.enumerated() {
            print("\(index + 1). \(newEntry.topic)")
            print("\(newEntry.note)")
        }
    }
    func today() { // печатает записи, у которых date сегодняшняя
        let entriesToday = entries.filter { Calendar.current.isDateInToday($0.date) }
        if entriesToday.isEmpty {
            print("No entries today")
            return
        }
        
        let formatted = DateFormatter()
        formatted.dateFormat = "yyyy-MM-dd"
        let todayString = formatted.string(from: Date())
        for (index, newEntry) in entriesToday.enumerated() {
            let dateString = formatted.string(from: newEntry.date)


            print("\n📅 Сегодняшние записи (\(todayString)):")
            for (index, entry) in entriesToday.enumerated() {
                print("   \(index + 1). 🔤 \(entry.topic)")
                print("      📝 \(entry.note)")
            }
        }
    }
}
