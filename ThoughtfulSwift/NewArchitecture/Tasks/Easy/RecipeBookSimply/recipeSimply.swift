//
//  recipeSimply.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 18.06.2026.
//🍳 🥘 🍲 🥣 🔪 🥢 🍴 🥩 🥓 🍗 🍖 🍤 🍣 🍥 🍕 🍔 🌮 🌭 🍝 🧀 🍰 🧁 🍩 🥞 🥦 🥕 🌽 🌶️ 🥔 🧅 🧄 🍳 🧂 🧈 🍞 🥐 🍚 🍜 🥟 🍢 🥮 🍧 🍦 🍨 🍪 🎂 🍫 🍬 🍭 🍯 🥛 ☕ 🍵 🍶 🍾 🍷 🍸 🍹 🍺 🍻 🥤 🧃 🧉 🧊 🥢 🍽️ 🥣 🥡 🧂

import Foundation

struct RecipeSimple: Codable { // модель данных (хранит имя, ингредиенты, шаги, категорию)
    let name: String
    let ingredients: [String]
    let steps: [String]
    let category: RecipeSimpleCategories
    let date = Date() // Теперь Swift позволит не передавать дату при создании вручную
    
   
}

enum RecipeSimpleCategories: String, Codable {
    case salads, meat, fish, pies, soups, sidedishes
    
    var recipeSimpleCategoryEmoji: String {
        switch self {
        case .salads:
            return "📕🥦"
        case .meat:
            return "📗🥩"
        case .pies:
            return "📙🍰"
        case .fish:
            return "🍤"
        case .soups:
            return "🥣"
        case .sidedishes:
            return "🥘"
        }
    }
}

