//
//  difficaltyLevel.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 02.06.2026.
//

import Foundation

enum DifficultyLevel: String {
    case easy
    case medium
    case hard
    case fixmistakes
    
    var tasks: [ExecutableTask] {
        switch self {
        case .easy:
            return [
                ToDoTracker()
            ]
        case .medium:
            return []
        case .hard:
            return []
        case .fixmistakes:
            return [
                ArgumentExplorerTask(),
                ExitVsReturnTask(),
                SeasonCheckerTask(),
                FindUserTask() 
            ]
        }
    }
}
