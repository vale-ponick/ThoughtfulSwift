//
//  recipeBookStore.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 18.06.2026.
//

import Foundation

class RecipeSimleStore { //управляет массивом рецептов
    var recipes: [Recipe] = []
    
    init(initialRecipes: [Recipe] = []) { // это инициализатор с параметром по умолчанию
        self.recipes = initialRecipes // задаёт начальный массив для RecipeStore
    }
    
    private var fileURL: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appending(path: "recipes.json", directoryHint: .notDirectory) //Указывает, является ли путь папкой/файлом -> улучшает производительность
    }
    
    private func formattedDate(_ date: Date)-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    func add(name: String, ingredients: [String], steps: [String], category: RecipeCategories) {
        let recipe = Recipe(name: name, ingredients: ingredients, steps: steps, category: category)
        recipes.append(recipe)
        print("✅ Added: \(name)")
    }
    func list() { // Показывает список рецептов (кратко): что у меня есть?
        if recipes.isEmpty {
            print("no recipe")
            return // return выходит из метода list(), а не из программы
        }
        for (index, recipe) in recipes.enumerated() { // Это метод, который превращает массив в последовательность пар: (index, element)
            print("\(index + 1). \(recipe.name)")
        }
    }
    func view(at number: Int) -> Bool { // // Проверяем, входит ли индекс в границы массива recipes
        
        let index = number - 1
        guard recipes.indices.contains(index) else {
            return false
        }
        let recipe = recipes[index]
        
        print("\(recipe.name)")
        print("Category: \(recipe.category)")
        print("📅 Date: \(formattedDate(recipe.date))")
        
        print("Ingredients:")
        
        for (ingredient) in recipe.ingredients {
            print("  ▫️ \(ingredient)")
        }
        print("👩‍🍳 Steps:")
        
        for (index, step) in recipe.steps.enumerated() {
            print("\(index + 1). \(step)")
        }
        return true
    }
    func delete(at number: Int) -> Bool {
        let index = number - 1
        guard recipes.indices.contains(index) else {
            return false
        }
        let recipe = recipes[index]
        recipes.remove(at: index)
        
        print("\(recipe.name) delete")
        return true
    }
    func exportToText() {
        var result = ""
        for recipe in recipes {
            result += " -- \(recipe.name) -- \n"
            result += "📅 \(formattedDate(recipe.date))\n"
            result += "Category: \n"
            result += "Ingredients: \n"
            for ingredient in recipe.ingredients {
                result += " ▫️ \(ingredient) \n"
            }
            result += "👨‍🍳 Steps: \n"
            for (index, step) in recipe.steps.enumerated() {
                result += "\(index + 1). \(step) \n"
            }
            result += "\n"
        }
        
        let textURL = fileURL.deletingLastPathComponent().appending(path: "recipes.txt", directoryHint: .notDirectory)
    }
    
}
