//
//  recipe.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 17.06.2026.
//

import Foundation

struct Recipe { // модель данных
    let name: String
    var ingredients: [String]
    var steps: [String]
    let date = Date()
    let category: RecipeCategories
}
enum RecipeCategories { // модель данных
    case salads, soups, pies, sideDishes, meat, fish
}
