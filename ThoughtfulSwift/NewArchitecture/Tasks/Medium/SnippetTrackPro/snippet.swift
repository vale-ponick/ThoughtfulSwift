//
//  snippet.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 12.06.2026.
//

import Foundation

struct Snippet: Codable {
    var id = UUID() // — уникальный идентификатор
    let title: String
    let code: String
    let note: String
    let date: Date
    
    init(id: UUID = UUID(), title: String, code: String, note: String) {
        self.id = id
        self.title = title
        self.code = code
        self.note = note
        self.date = Date()
    }
}
