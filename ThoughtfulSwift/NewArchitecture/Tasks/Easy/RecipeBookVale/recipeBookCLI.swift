//
//  recipeBookCLI.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 17.06.2026.
//

import Foundation

struct RecipeBookTask: ExecutableTask {
    let id = "3"
    
    func run() {
        let recipeStore = RecipeStore()
        recipeStore.load()
        
        print("🍳 RecipeBookTask: книга рецептов")
        print("Commands: new, list, view, delete, export, quit")
        
        while true {
            print("\n> ", terminator: "")
            guard let input = readLine()?.lowercased() else { continue }
            
            switch input {
            case "new":
                addNewRecipe(store: recipeStore)
                
            case "list":
                recipeStore.list()
                
            case "view":
                print("Enter number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                if !recipeStore.view(at: num) {
                    print("❌ Recipe not found")
                }
                
            case "delete":
                print("Enter number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                if recipeStore.delete(at: num) {
                    print("🗑️ Deleted")
                } else {
                    print("❌ Invalid number")
                }
                
            case "export":
                recipeStore.exportToText()
                
            case "quit":
                recipeStore.save()
                print("By, vale.ponick!")
                return
                
            default:
                print("❌ Unknown command")
            }
        }
    }
    
    func addNewRecipe(store: RecipeStore) {
        print("Name: ", terminator: "")
        guard let name = readLine(), !name.isEmpty else {
            print("❌ Name cannot be empty")
            return
        }
        
        var ingredients: [String] = []
        print("Ingredient (or 'done' to finish): ", terminator: "")
        while let input = readLine(), input.lowercased() != "done" {
            if !input.isEmpty {
                ingredients.append(input)
            }
            print("Ingredient (or 'done' to finish): ", terminator: "")
        }
        
        var steps: [String] = []
        print("Step (or 'done' to finish): ", terminator: "")
        while let input = readLine(), input.lowercased() != "done" {
            if !input.isEmpty {
                steps.append(input)
            }
            print("Step (or 'done' to finish): ", terminator: "")
        }
        
        print("Category (salads, soups, pies, sideDishes, meat, fish): ", terminator: "")
        guard let catInput = readLine()?.trimmingCharacters(in: .whitespaces),
              let category = RecipeCategories(rawValue: catInput) else {
            print("❌ Invalid category")
            return
        }
        
        store.add(name: name, ingredients: ingredients, steps: steps, category: category)
    }
}
