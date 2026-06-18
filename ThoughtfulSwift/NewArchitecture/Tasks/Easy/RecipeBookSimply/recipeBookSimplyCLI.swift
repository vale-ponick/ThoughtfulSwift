//
//  recipeBookSimplyCLI.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 18.06.2026.
//

import Foundation

struct RecipeBookSimpleTask: ExecutableTask {
    let id = "4"
    
    func run() {
        let recipeSimpleStore = RecipeSimleStore()
        recipeSimpleStore.load()
        
        print("🍯 RecipeBookSingly - Grandma's and Mom's recipes, and mine too")
        print("Commands: new, list, view, delete, export, quit")
        
        while true {
            print("\n> ", terminator: "")
            guard let input = readLine()?.lowercased() else { continue }
            
            switch input {
            case "new": // запросить название, ингредиенты, шаги, категорию
                print("Name: ", terminator: "")
                guard let name = readLine(), !name.isEmpty else {
                    print("❌ Name cannot be empty")
                    continue
                }
                
                var ingredients: [String] = []
                print("Ingredient (or 'done' to finish): ", terminator: "")
                while let ingredient = readLine(), ingredient.lowercased() != "done" {
                    if !ingredient.isEmpty {
                        ingredients.append(ingredient)
                    }
                    print("Ingredient (or 'done' to finish): ", terminator: "")
                }
                
                var steps: [String] = []
                print("Step (or 'done' to finish): ", terminator: "")
                while let step = readLine(), step.lowercased() != "done" {
                    if !step.isEmpty {
                        steps.append(step)
                    }
                    print("Step (or 'done' to finish): ", terminator: "")
                }
                
                print("Category (salads, soups, pies, sideDishes, meat, fish): ", terminator: "")
                guard let categoryInput = readLine()?.lowercased(),
                      let category = RecipeSimpleCategories(rawValue: categoryInput) else {
                    print("❌ Invalid category")
                    continue
                }
                
                recipeSimpleStore.add(name: name, ingredients: ingredients, steps: steps, category: category)
            case "list":
                recipeSimpleStore.list()
            case "view": // запросить номер + вызвать recipeStore.view(at: number)
                print("Enter number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                if !recipeSimpleStore.view(at: num) {
                    print("❌ Recipe not found")
                }
            case "delete": // запросить номер + вызвать recipeStore.delete(at: number)
                print("Enter number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                if recipeSimpleStore.delete(at: num) {
                    print("🗑️ Deleted")
                } else {
                    print("❌ Invalid number")
                }
            case "export":
                recipeSimpleStore.exportToText()

            case "quit":
                recipeSimpleStore.save()
                print("By, vale.ponick!")
                
                return
            default:
                print("❌ Unknown command")
            }
        }
    }
}




