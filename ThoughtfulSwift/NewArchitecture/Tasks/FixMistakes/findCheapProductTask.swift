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
        print("📝 FindCheapProductTask - using .first(where:)")

        let products = [
            (name: "MacBook Pro", price: 450000),
            (name: "iPhone Max", price: 130000),
            (name: "iPad", price: 80000),
            (name: "AirPods 4", price: 15000)
        ]
        if let minPrice = products.min(by: { $0.price < $1.price }) {
            print(" Cheapest product found: \(minPrice.name) for \(minPrice.price)")
        } else {
            print("Products list is empty")
   
        }
    }
}

   
