//
//  weatherService.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 21.06.2026.
//

import Foundation

// MARK: - сервис для работы с API погоды -> отвечает за запрос данных к Open-Meteo и их парсинг

func getTemperature() {
     let url = "https://api.open-meteo.com/v1/forecast?latitude=56.085&longitude=92.573&current_weather=true"// 1. URL
       // 2. Запрос
       // 3. Декодирование
    
}
// Широта: 56.085380° Долгота: 92.573007°
