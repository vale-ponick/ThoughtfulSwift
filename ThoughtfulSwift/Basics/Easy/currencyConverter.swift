//
//  currencyConverter.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 29.05.2026.

import Foundation
 
// MARK: - Интерактивный конвертер валют

func runCurrencyConverter() {
    print("Введите сумму в USD:")
    
    guard let input = readLine(),
          let usd = Double(input) else {
        print("❌ Amount must be a number")
        return
    }
    
    let eur = usd * 0.92
    let rub = usd * 88.5
    
    print("💰 \(usd) USD = \(eur) EUR")
    print("💰 \(usd) USD = \(rub) RUB")
}





