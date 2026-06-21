//
//  bookCLI.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 19.06.2026.
//

import Foundation

struct BookCLI: ExecutableTask {
    let id = "5"
    
    func run() {
        let store = BookStore()
        store.load()
        
        print("SwiftBookshelf - my collection books on Swift")
        print("Commands: new, list, view, delete, save, load, export, quit")
        
        while true {
            print("\\n ", terminator: "")
            guard let input = readLine()?.lowercased() else { continue }
            
            switch input {
            case "new":
                print("Enter title: ", terminator: "")
                guard let title = readLine(), !title.isEmpty else {
                    print("Title can't be empty")
                    continue
                }
                print("Enter author: ", terminator: "")
                guard let author = readLine(), !author.isEmpty else {
                    print("Author can't be empty")
                    continue
                }
                print("Enter year: ", terminator: "")
                guard let yearInput = readLine(), !yearInput.isEmpty,
                      let year = Int(yearInput) else {
                    print("Year must be a number")
                    continue
                }
                print("Enter category(basics, algorithms, ios, system, other: ", terminator: "")
                guard let categoryInput = readLine(), !categoryInput.isEmpty,
                      let category = BookCategory(rawValue: categoryInput) else {
                    print("Invalid category")
                    continue
                }
                print("Enter format(paper, digital): ", terminator: "")
                guard let formatInput = readLine(), !formatInput.isEmpty,
                      let format = BookFormat(rawValue: formatInput) else {
                    print("Invalid format")
                    continue
                }
                print("Enter link (or press Enter to skip: ", terminator: "")
                let link = readLine()
                let linkValue = link?.isEmpty == true ? nil : link
                
                print("Is read? (yes/no): ", terminator: "")
                let isReadInput = readLine()?.lowercased()
                let isRead = isReadInput == "yes" || isReadInput == "y"
                
                let book = Book(
                    title: title,
                    author: author,
                    year: year,
                    category: category,
                    format: format,
                    link: linkValue,
                    isRead: isRead)
                
                store.add(book: book)
            case "view":
                print("Enter number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                store.view(at: num - 1)
                
            case "list":
                store.list()
            case "save":
                store.save()
            case "load":
                store.load()
            case "export":
                store.export()
            case "delete":
                print("Enter number: ", terminator: "")
                guard let numStr = readLine(), let num = Int(numStr) else {
                    print("❌ Invalid number")
                    continue
                }
                store.delete(at: num - 1)
            case "quit":
                store.save()
                print("By, vale.ponick!")
                return
            default:
                print("Unknown command")
            }
            
        }
    }
}
