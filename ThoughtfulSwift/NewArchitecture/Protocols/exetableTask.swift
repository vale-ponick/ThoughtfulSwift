//
//  exetableTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 02.06.2026.
//

import Foundation

protocol ExetableTask {
    var id: String { get }
    func run()
}
