//
//  recipeStore.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 17.06.2026.
//

import Foundation

class RecipeStore {
    private(set) var recipes: [Recipe] = [] // хранилище!
    
    init(recipes: [Recipe] = []) { // cоздаётся сразу с пустым массивом - безопасно
        self.recipes = recipes
        load() // зачем? при инициализации сразу выгрузка в JSON?
    }
    private var fileURL: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("recipes.json")
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    func add() {
    }
    func view() {
    }
    func delete() {
    }
    func list() { // названия рецептов с номерами
    }
    func load() { // Загрузить из JSON
    }
    func save() { // сохранить в JSON
    }
    func export() { // выгрузить в recipes.txt
    }
}
