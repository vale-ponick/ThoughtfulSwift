//
//  currencyConverter.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 29.05.2026.

import Foundation
 
// MARK: - Интерактивный конвертер валют

func runCurrencyConverter() {
    print("Введите сумму в RUB:")
    
    guard let input = readLine(),
          let rub = Double(input) else {
        print("❌ Amount must be a number")
        return
    }
    
    let eur = rub / 83.69
    let usd = rub / 71.37
    
    print("💰 \(rub) RUB = \(eur) EUR")
    print("💰 \(rub) RUB = \(usd) USD")
}
/* 
 Выберите модуль: 1 - Currency, 2 - LeapYear
 1
 Введите сумму в RUB:
 30000
 💰 30000.0 RUB = 358.4657665192974 EUR
 💰 30000.0 RUB = 420.3446826397646 USD
 */



