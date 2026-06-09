//
//  taskManager.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 08.06.2026.
//

import Foundation

class TaskManager {
    
    private(set) var tasks: [Task] = [] // — массив задач (только чтение снаружи)
    private var fileURL: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("tasks.json")
    }
    
    func add(title: String) { // прими строку 'title'
        let newTask = Task(title: title) // создай новую задачу
        tasks.append(newTask) // добавь ее в массив
    }
        func list() {
            if tasks.isEmpty { // сначала проверь: массив пуст?
                print("No tasks")
                return
            }
            
            for (index, task) in tasks.enumerated() { // потом запусти цикл
                let status = task.isCompleted ? "✅" : "❌"
                print("\(index + 1). \(status) \(task.title)")
            }
        }
        
        func done(at number: Int) -> Bool { // 1. Преобразуем пользовательский номер (1,2,3...) в индекс массива (0,1,2...)
            
          let index = number - 1
            guard tasks.indices.contains(index) else { // 2. Проверяем, существует ли индекс в массиве
                //   tasks.indices — это диапазон допустимых индексов (0..<tasks.count)
                
                return false  // 3. Если индекса нет — возвращаем false (неудача)
            }
            tasks[index].isCompleted = true // 4. Отмечаем задачу как выполненную
            return true // 5. Возвращаем true (успех)
        }
        
        func delete(at number: Int) -> Bool {
           let index = number - 1 // Преобразование индекса: Вычисляем индекс в массиве
            guard tasks.indices.contains(index) else {
                //   tasks.indices — это диапазон допустимых индексов (0..<tasks.count)
                return false // index not exist -> array not changed
            }
            tasks.remove(at: index) // delete element on index -> array is change!
            return true
        }
        
        func save() {
         let encoder = JSONEncoder() // ?
            encoder.outputFormatting = .prettyPrinted // чтобы JSON был читаемым -> кодируем tasks в JSON
            guard let data = try?encoder.encode(tasks) else {
                print("❌ Failed to encode tasks")
                return
            }
            
            do {
                try data.write(to: fileURL)
                print("✅ Saved \(tasks.count) tasks")
            } catch {
                print("❌ Failed to save: \(error.localizedDescription)")
            }
        }
        
        func load() {
            guard FileManager.default.fileExists(atPath: fileURL.path) else { // 1. Проверить, существует ли файл
                return  // нет файла — не ошибка, просто выходим
            }
            // 2. Прочитать данные из файла
            guard let data = try? Data(contentsOf: fileURL) else {
                print("❌ Failed to read data")
                return
            }
            
            // 3. Декодировать JSON в массив задач
            let decoder = JSONDecoder()
            guard let loadedTasks = try? decoder.decode([Task].self, from: data) else {
                print("❌ Failed to decode tasks")
                return
            }
            
            // 4. Заменить текущий массив
            tasks = loadedTasks
            print("✅ Loaded \(tasks.count) tasks")
    }
}

/*
 
 
 load()    Загружает задачи из файла (пока заглушка)
Подсказки (без кода)
Индексация:

Пользователь видит 1, 2, 3...

В массиве индексы 0, 1, 2...

Методы done(at:) и delete(at:) принимают пользовательский номер, внутри преобразуют в индекс массива (num - 1)

Статус:

isCompleted == true → "✅"

isCompleted == false → "❌"

Формат вывода list():

text
1. ✅ Buy milk
2. ❌ Write code */
