//
//  snippetStore.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 12.06.2026.
//

import Foundation

class SnippetStore {
        
        private var fileURL: URL { // путь к snippets.json
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return urls[0].appendingPathComponent("snippets.json")
        }
    
    private(set) var snippets: [Snippet] = [] // массив сниппетов
    
    init(snippets: [Snippet] = []) { // инициация экземпляра класса
        self.snippets = snippets
        load()
    }
     
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    func addSnippet(title: String, code: String, note: String) {
           let newSnippet = Snippet(title: title, code: code, note: note)
        snippets.append(newSnippet)
        print("✅ Added snippet: \(title)")
    }
    
    func list() { // печать всех сниппетов
        
        guard !snippets.isEmpty else {
            print("No snippets")
            return
        }
        for (index, snippet) in snippets.enumerated() {
            print("\(index + 1). \(snippet.title)")
            print("📝 \(snippet.note)")
            print("🛠️ \(snippet.code)")
            print("📅  \(formattedDate(snippet.date))")
        }
    }
    func today() {
        let todaySnippets = snippets.filter { Calendar.current.isDateInToday($0.date) }
        guard !todaySnippets.isEmpty else {
            print("📭 No snippets today")
            return
        }
        print("\n📅 Today's snippets (\(formattedDate(Date()))):")
        for (index, snippet) in todaySnippets.enumerated() {
            print("   \(index + 1). 🧩 \(snippet.title)")
            print("       📝 \(snippet.note)")
            print("       🛠️ \(snippet.code)")
        }
    }
            
            func save() {
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                encoder.dateEncodingStrategy = .iso8601   // ← добавить сюда
                guard let data = try? encoder.encode(snippets) else {
                    print("❌ Failed to encode snippets")
                    return
                }
                do {
                    try data.write(to: fileURL)
                    print("✅ Saved \(snippets.count) snippets")
                } catch {
                    print("❌ Failed to save: \(error.localizedDescription)")
                }
            }
    func load() {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
        guard let data = try? Data(contentsOf: fileURL) else {
            print("❌ Failed to read data")
            return
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601   // ← добавить эту строку
        guard let loaded = try? decoder.decode([Snippet].self, from: data) else {
            print("❌ Failed to decode snippets")
            return
        }
        snippets = loaded
        print("✅ Loaded \(snippets.count) snippets")
    }
    func delete(at number: Int) -> Bool {
       let index = number - 1
        guard snippets.indices.contains(index) else {
            return false
        }
        snippets.remove(at: index) // delete element on index -> array is change!
        return true
    }
}
