//
//  recipe.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 17.06.2026.
//

import Foundation

struct Recipe {
    let name: String
    var ingredients: [String]
    var steps: [String]
    let date = Date()
    let category: RecipeCategories
}
enum RecipeCategories {
    case salads, soups, pies, sideDishes, meat, fish
}
