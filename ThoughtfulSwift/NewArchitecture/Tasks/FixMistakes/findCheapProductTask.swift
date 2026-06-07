//
//  findCheapProductTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 06.06.2026.
//

import Foundation

// MARK: - FindCheapProductTask

struct FindCheapProductTask: ExecutableTask {
    let id = "fix6"
    
    func run() {
        print("📝 FindCheapProductTask - using Method chaining (.min(by:) + .map().max())")
        
        let products = [
            (name: "MacBook Pro", price: 450000),
            (name: "iPhone Max", price: 130000),
            (name: "iPad", price: 80000),
            (name: "AirPods 4", price: 15000)
        ]
        if let minPrice = products.min(by: { $0.price < $1.price }) { // using .min(by:)/.max(by:)
        print(" Cheapest product found: \(minPrice.name) for \(minPrice.price)")
    } else {
            print("Products list is empty")
            
        }
        
        let maxPrice = products.map { $0.price }.max() ?? 0 // using .map{ $0.price } извлекает ТОЛЬКО цены и создает НОВЫЙ массив + .max() - находит max число в этом массиве цен +  ?? 0 если массив пуст -> возвращает nil - используй 0
        if let expensive = products.first(where: { $0.price == maxPrice }) { // using .first(where: )
        print(" Expensive product found: \(expensive.name) for \(expensive.price)")
        } else {
            print("Products list is empty")
        }
    }
}

   
