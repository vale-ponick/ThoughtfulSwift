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
        print("🍳 RecipeBookTask: книга рецептов. Команды: new, list, today, export, quit")
    }
}
