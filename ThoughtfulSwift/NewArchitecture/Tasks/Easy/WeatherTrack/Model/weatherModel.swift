//
//  weatherModel.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 21.06.2026.
//

import Foundation

struct WeatherResponse: Codable {
    var currentWeather: CurrentWeather
}

struct CurrentWeather: Codable {
    let temperature: Double     // температура в °C
    let windspeed: Double       // скорость ветра в км/ч
    let weathercode: Int        // код погоды (WMO standard)
    
    // MARK: - Расшифровка кода погоды
    var weatherDescription: String {
        switch weathercode {
        case 0: return "☀️ Clear" 
        case 1, 2, 3: return "☁️ Cloudy" // Облачно
        case 45, 48: return "🌫️ Fog" // Туман
        case 51, 53, 55: return "🌦️ Drizzle" // Морось
        case 56, 57: return "🌧️ Freezing drizzle" // Ледяная морось
        case 61, 63, 65: return "🌧️ Rain"
        case 66, 67: return "🌧️ Freezing rain" // Ледяной дождь
        case 71, 73, 75: return "❄️ Snow" // Снег
        case 77: return "❄️ Snow grains" // Снежная крупа
        case 80, 81, 82: return "⛈️ Showers" // Ливень
        case 85, 86: return "❄️ Snow showers" // Снегопад
        case 95, 96, 99: return "⛈️ Thunderstorm" // Гроза
        default: return "❓ Unknown"
        }
    }
}
    

