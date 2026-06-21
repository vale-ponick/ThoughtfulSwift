//
//  book.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 19.06.2026.
//

import Foundation

enum BookFormat: String, Codable { // model of data
    case paper, digital
}

enum BookCategory: String, Codable { // model of data
    case basics, algorithms, ios, system, other
}

struct Book: Codable { // model of data
    let title: String
    let author: String
    let year: Int
    let category: BookCategory
    let format: BookFormat
    let link: String?
    var isRead: Bool
}
