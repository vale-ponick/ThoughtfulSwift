
//  argumentExplorerTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 03.06.2026.
//

import Foundation

// MARK: - ArgumentExplorerTask

/* ✅ Цель: Закрепить понимание CommandLine.arguments.

 Что нужно сделать:
 Вывести количество переданных аргументов
 Вывести каждый аргумент с индексом
 Формат вывода:
 
  Arguments count: 3
  [0] ./thoughtful
  [1] fixMistakes
  [2] 1
  */
 

struct ArgumentExplorerTask: ExecutableTask {
    let id = "fix1"
        
    func run() {
        print("🔍 ArgumentExplorerTask - использование аргументов")
        
        let arguments = CommandLine.arguments
        
        // Вывод количества аргументов
        print("Arguments count: \(arguments.count)")
        
        // Вывод каждого аргумента с индексом
        for (index, arg) in arguments.enumerated() {
            let displayArg = index == 0 ? "./" + URL(fileURLWithPath: arg).lastPathComponent : arg // «Чтобы из полного пути получить только имя программы, я превращаю строку в URL, беру lastPathComponent и при желании добавляю ./ для красоты.»
            print("[\(index)] \(displayArg)")
        }
    }
}

/*
 🚕💨 Уровень: FIXMISTAKES | ✅ Модуль ID: fix1

 🔍 ArgumentExplorerTask - использование аргументов
 Arguments count: 3
 [0] ./ThoughtfulSwift
 [1] fixmistakes
 [2] fix1
 */

/*
 let displayArg = index == 0 ? "./" + URL(fileURLWithPath: arg).lastPathComponent : arg
 Часть         Что делает
 index == 0    условие: если первый аргумент
 "./" + URL(fileURLWithPath: arg).lastPathComponent
 ->     ветка true — выполняется, если условие true
 arg    ->     ветка false — выполняется, если условие false
 
 NB: URL(fileURLWithPath:) → .lastPathComponent
 
 По шагам:
 URL(fileURLWithPath: arg) — превращает строку arg в спец. тип URL, который умеет работать с путями файлов.
 Пример: arg = "/Users/me/.../ThoughtfulSwift" → URL
 
 .lastPathComponent — вырезает последний компонент пути
 Пример: "ThoughtfulSwift"
 
 "./" + ... — добавляет ./ в начало
 Пример: "./ThoughtfulSwift"
 */

let path = "/Users/me/Desktop/script.swift"
let url = URL(fileURLWithPath: path)
// print(url.lastPathComponent) // "script.swift"
