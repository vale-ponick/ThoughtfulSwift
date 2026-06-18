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
        let RecipeSimleStore = RecipeSimleStore()
        RecipeSimleStore.load()
        
        print("🍯 RecipeBookSingly - Grandma's and Mom's recipes, and mine too")
        print("Commands: new, list, view, delete, export, quit")
    }
}




