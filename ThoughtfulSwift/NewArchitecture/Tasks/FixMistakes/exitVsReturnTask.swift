
//  exitVsReturnTask.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 03.06.2026.
//

import Foundation

struct ExitVsReturnTask: ExecutableTask {
    let id = "fix2"
    
    func run() {
            print("🔄 Exit vs Return — difference between exit(1) и return")
            validateUserInput()
            print("✅ Программа продолжает работу")
        }
    
    func validateUserInput() {
        print("\nEnter number (1...10): ", terminator: "")
        
        guard let numberStr = readLine(), let num = Int(numberStr), (1...10).contains(num) else {
            print("❌ Invalid. Program terminated.")
            exit(1)   // ← здесь программа УМРЁТ
        }
        
        print("✅ Valid number. Returning to run()...")
        return
    }
}
/* 🚕💨 Уровень: FIXMISTAKES | ✅ Модуль ID: fix2
 
 🔄 Exit vs Return — difference between exit(1) и return

 Enter number (1...10): 1
 ✅ Valid number. Returning to run()...
 ✅ Программа продолжает работу */


