//
//  task.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 08.06.2026.
//

import Foundation

struct Task: Codable {
    var id = UUID() // — уникальный идентификатор
    let title: String // — название задачи
    var isCompleted = false // — статус выполнения
}


