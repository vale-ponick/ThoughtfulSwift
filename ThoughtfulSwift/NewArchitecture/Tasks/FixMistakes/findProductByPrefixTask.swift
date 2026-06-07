//
//  findProductByPrefixTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 07.06.2026.
//

import Foundation


//MARK: - ✅ ТЗ: FindProductByPrefixTask

/* Что прокачиваем: Поиск с условием hasPrefix()                      Работа с вводом пользователя
                    Закрепление first(where:)
Запросить у пользователя префикс (часть названия в начале)
Найти первый товар, название которого начинается с этого префикса
Вывести: если
        найден → "Found: iPad for 80000"
        не найден → "No products starting with 'iP' found" */

struct FindProductByPrefixTask: ExecutableTask {
    let id = "fix7"
    
    func run() {
        print("FindProductByPrefixTask - using .hasPrefix() + .first(where:)")
        
        let products = [
            (name: "MacBook Pro", price: 450000),
            (name: "iPhone Max", price: 130000),
            (name: "iPad", price: 80000),
            (name: "AirPods 4", price: 15000)
        ]
        
        print("Enter product name prefix (e.g., iP, Mac, Air): ")
        
        guard let input = readLine()?.trimmingCharacters(in: .whitespaces).lowercased() else {
            print("No input")
            return
        }
        
        guard !input.isEmpty else {
            print("Prefix cannot be empty")
            return
        }
        
        if let productByPref = products.first(where: { $0.name.lowercased().hasPrefix(input) } ) {
            print("Found: \(productByPref.name) for \(productByPref.price)")
        } else {
            print("No products starting with '\(input.uppercased())' found")
        }
    }
}
