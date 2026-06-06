//
//  FindProductTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 05.06.2026.
//

import Foundation

struct FindProductTask: ExecutableTask {
    let id = "fix5"
    
    func run() {
        print("📝 FindProductTask - использование .first(where:)")
        let products = [
            (name: "MacBook Pro", price: 450000),
            (name: "iPhone Max", price: 130000),
            (name: "iPad", price: 80000),
            (name: "AirPods 4", price: 15000)
        ]
        
        print("Enter max price: ", terminator: "")
        
        guard let input = readLine()?.trimmingCharacters(in: .whitespaces) else {
            print("❌ No input")
            return
        }
        guard let inputInt = Int(input) else {
            print("❌ No number")
            return
        }
        if let userProduct = products.first(where: { $0.price <= inputInt }) {
            print("Найден: \(userProduct.name) за \(userProduct.price)")
        } else {
            print("Товаров дешевле \(inputInt) нет")
        }
    }
}
        

