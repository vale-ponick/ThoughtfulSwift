//
//  seasonCheckerTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 03.06.2026.
//

import Foundation

enum Season: String {
    case spring
    case summer
    case autumn
    case winter
    
    var description: String {
        switch self {
        case .spring: return "🐝 Весна"
        case .summer: return "☀️ Лето"
        case .autumn: return "🍂 Осень"
        case .winter: return "🌨 Зима"
        }
    }
}
    
    struct SeasonCheckerTask: ExecutableTask {
        let id = "fix3"
        
        func run() {
            print("🔍 SeasonCheckerTask - check seasons on rawValue")
            
            print("Enter season (spring, summer, autumn, winter): ", terminator: "")
                
            guard let input = readLine()?.lowercased() else {
                print("❌ No input.")
                return
            }
            if let season = Season(rawValue: input) {
                  print("\(season.description) → rawValue: \(season.rawValue)")
              } else {
                  print("❌ Season '\(input)' not found")
              }
          }
      }

