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
    
    func add(name: String, ingredients: [String], steps: [String], category: RecipeCategories) {
        let newRecipe = Recipe(name: name, ingredients: ingredients, steps: steps, category: category)
        recipes.append(newRecipe) // добавь ее в массив
        print("✅ Added: \(name)")
    }
    func view(at number: Int) -> Bool { // Преобразуем пользовательский номер (1,2,3...) в индекс массива (0,1,2...)
        
      let index = number - 1
        guard recipes.indices.contains(index) else { // 2. Проверяем, существует ли индекс в массиве
            //   recipes.indices — это диапазон допустимых индексов (0..<recipes.count)
            return false  // 3. Если индекса нет — возвращаем false (неудача)
        }
        let recipe = recipes[index]
        print("📖 \(recipe.name)")
        print("📂 Категория: \(recipe.category)")
        print("📅 Дата: \(formattedDate(recipe.date))")
        print("📝 Ингредиенты:")
        for ingredient in recipe.ingredients {
            print("   • \(ingredient)")
        }
        print("👨‍🍳 Шаги:")
        for (i, step) in recipe.steps.enumerated() {
            print("   \(i + 1). \(step)")
        }
        return true // 5. Возвращаем true (успех)
    }
    func delete(at number: Int) -> Bool {
       let index = number - 1 // Преобразование индекса: Вычисляем индекс в массиве
        guard recipes.indices.contains(index) else {
            //   recipes.indices — это диапазон допустимых индексов (0..<recipes.count)
            return false // index not exist -> array not changed
        }
        recipes.remove(at: index) // delete element on index -> array is change!
        return true
    }
    func list() { // названия рецептов с номерами
        if recipes.isEmpty {
            print("No recipes")
            return
        }
        for (index, recipe) in recipes.enumerated() {
            print("\(index + 1). \(recipe.name)")
        }
    }
    func load() { // Загрузить из JSON
        guard FileManager.default.fileExists(atPath: fileURL.path) else { // 1. Проверить, существует ли файл
            return  // нет файла — не ошибка, просто выходим
        }
        // 2. Прочитать данные из файла
        guard let data = try? Data(contentsOf: fileURL) else {
            print("❌ Failed to read data")
            return
        }
        // 3. Декодировать JSON в массив задач
        let decoder = JSONDecoder()
        guard let loadedRecipes = try? decoder.decode([Recipe].self, from: data) else {
            print("❌ Failed to decode recipe")
            return
        }
        
        // 4. Заменить текущий массив
        recipes = loadedRecipes
        print("✅ Loaded \(recipes.count) recipes")
    }

    func save() { // сохранить в JSON
        print("💾 Saving recipe to: \(fileURL.path)")
        print("📂 Full path: \(fileURL.path)")
      
     let encoder = JSONEncoder() // ?
        encoder.outputFormatting = .prettyPrinted // чтобы JSON был читаемым -> кодируем recipes в JSON
        guard let data = try?encoder.encode(recipes) else {
            print("❌ Failed to encode recipes")
            return
        }
        
        do {
            try data.write(to: fileURL)
            print("✅ Saved \(recipes.count) recipes")
        } catch {
            print("❌ Failed to save: \(error.localizedDescription)")
        }
    }
    
    func exportToText() { // выгрузить в recipes.txt
        var result = ""
        for recipe in recipes {
            result += "--- \(recipe.name) ---\n"
            result += "📅 \(formattedDate(recipe.date))\n"
            result += "---\n\n"
        }

        let textURL = fileURL.deletingLastPathComponent().appendingPathComponent("recipes.txt")

        guard let data = result.data(using: .utf8) else {
            print("❌ Failed to convert text to data")
            return
        }
        do {
            try data.write(to: textURL)
            print("✅ Exported \(recipes.count) recipes to recipes.txt")
        } catch {
            print("❌ Failed to export: \(error.localizedDescription)")
        }
    }
}
