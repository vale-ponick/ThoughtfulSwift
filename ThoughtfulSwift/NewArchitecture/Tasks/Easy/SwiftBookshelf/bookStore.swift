//
//  bookStore.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 19.06.2026.
//

import Foundation

class BookStore {
    private(set) var bookshelf: [Book] = []
    
    private var fileURL: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("books.json")
    }
    
    func add(book: Book) {
        bookshelf.append(book)
        print("✅ Added \(book.title)")
    }
    
    func delete(at index: Int) {
        guard bookshelf.indices.contains(index) else {
            print("❌ Invalid index")
            return
        }
        let removedBook = bookshelf.remove(at: index)
        print("🗑️ Deleted: \(removedBook.title)")
    }
    
    func view(at index: Int) {
        guard bookshelf.indices.contains(index) else {
            print("❌ Book not found")
            return
        }
        let book = bookshelf[index]
        print("📖 \(book.title)")
        print("✍️ Author: \(book.author)")
        print("📅 Year: \(book.year)")
        print("📂 Category: \(book.category)")
        print("📄 Format: \(book.format)")
        if let link = book.link {
            print("🔗 Link: \(link)")
        }
        print("📌 Read: \(book.isRead ? "✅" : "❌")")
    }
    
    func list() {
        guard !bookshelf.isEmpty else {
            print("📭 No books")
            return
        }
        for (index, book) in bookshelf.enumerated() {
            print("\(index + 1). \(book.title) — \(book.author) (\(book.year))")
        }
    }
    
    func save() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(bookshelf) else {
            print("❌ Failed to encode books")
            return
        }
        try? data.write(to: fileURL)
        print("✅ Saved \(bookshelf.count) books")
    }
    
    func load() {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
        guard let data = try? Data(contentsOf: fileURL) else {
            print("❌ Failed to read data")
            return
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode([Book].self, from: data) else {
            print("❌ Failed to decode books")
            return
        }
        bookshelf = loaded
        print("✅ Loaded \(bookshelf.count) books")
    }
    
    func export() {
        var result = ""
        for (index, book) in bookshelf.enumerated() {
            result += "\(index + 1). \(book.title) — \(book.author) (\(book.year))\n"
        }
        let textURL = fileURL.deletingLastPathComponent().appending(path: "books.txt", directoryHint: .notDirectory)
        guard let data = result.data(using: .utf8) else {
            print("❌ Failed to convert text")
            return
        }
        do {
            try data.write(to: textURL)
            print("✅ Exported \(bookshelf.count) books to books.txt")
        } catch {
            print("❌ Failed to export: \(error)")
        }
    }
}
