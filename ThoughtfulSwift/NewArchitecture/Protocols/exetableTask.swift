//
//  executableTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 02.06.2026.
//

import Foundation

protocol ExecutableTask {
    var id: String { get }
    func run()
}
