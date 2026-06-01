//
//  toDoManager.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 02.06.2026.
//

import Foundation

// MARK: - ToDoManager

/* TodoManager (Medium) —
 Структура Task
 Свойства: id (UUID), title (String), isCompleted (Bool)
 Класс TaskManager
 Хранилище задач: private(set) var tasks: [Task]
 Метод add(title:) — добавляет задачу
 Метод displayAll() — печатает все задачи с номерами и статусом
 Метод displayCompleted() — печатает только выполненные
 Метод displayUncompleted() — печатает только невыполненные
 Метод toggleStatus(at:) — меняет isCompleted по индексу, возвращает Bool
 Метод delete(at:) — удаляет задачу по индексу, возвращает Bool
 Метод isEmpty() — возвращает true, если задач нет
 main.swift
 Бесконечный цикл
 Печать меню
 Чтение команды через readLine()
 Проверка на пустую строку и nil
 Вызов методов TaskManager

 Команды пользователя (enum) — придумайте сами
 */
