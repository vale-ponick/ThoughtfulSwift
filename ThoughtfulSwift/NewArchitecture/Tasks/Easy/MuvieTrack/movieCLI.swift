//
//  movieCLI.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 21.06.2026.
//

import Foundation

struct MovieCLI: ExecutableTask {
    let id = "6"
    
    func run() {
        let store = MovieStore()
        store.load()
        
        print("Movies - collection films")
        print("Commands: new, list, view, delete, save, load, export, quit")
        
        while true {
            print("\\n ", terminator: "")
            guard let input = readLine()?.lowercased() else { continue }
            
            switch input {
            case "new":
                print("Enter title movie: ", terminator: "")
                guard let title = readLine(), !title.isEmpty else {
                    print("Title can't be empty")
                    continue
                }
                print("Enter director: ", terminator: "")
                guard let director = readLine(), !director.isEmpty else {
                    print("Director can't be empty")
                    continue
                }
                print("Enter year of release: ", terminator: "")
                guard let yearInput = readLine(), !yearInput.isEmpty,
                      let year = Int(yearInput) else {
                    print("Year must be a number")
                    continue
                }
                print("Enter genre (drama, comedy, fantasy, horror, history, documental) ", terminator: "")
                guard let genreInput = readLine(), !genreInput.isEmpty,
                      let genre = MovieGenre(rawValue: genreInput) else {
                    print("Invalid genre")
                    continue
                }
                print("Enter format(serial, featurefilm): ", terminator: "")
                guard let formatInput = readLine(), !formatInput.isEmpty,
                      let format = MovieFormat (rawValue: formatInput) else {
                    print("Invalid format")
                    continue
                }
                
                print("Enter release year: ", terminator: "")
                guard let releaseYearInput = readLine(), !releaseYearInput.isEmpty,
                      let releaseYear = Int(releaseYearInput) else {
                    print("❌ Release year must be a number")
                    continue
                }

                print("Enter runtime (in minutes): ", terminator: "")
                guard let runtimeInput = readLine(), !runtimeInput.isEmpty,
                      let runtime = Int(runtimeInput) else {
                    print("❌ Runtime must be a number")
                    continue
                }

                print("Enter rating (0-10): ", terminator: "")
                guard let ratingInput = readLine(), !ratingInput.isEmpty,
                      let rating = Int(ratingInput) else {
                    print("❌ Rating must be a number")
                    continue
                }
                
                print("Is watched? (yes/no): ", terminator: "")
                let isWatchedInput = readLine()?.lowercased()
                let isWatched = isWatchedInput == "yes" || isWatchedInput == "y"
                
                let movie = Movie(
                    title: title,
                    director: director,
                    releaseYear: releaseYear,
                    runtime: runtime,
                    genre: [genre],
                    rating: rating,
                    isWatched: isWatched
            )
                
                store.add(movie: movie)
            case "view":
                print("Enter number: ", terminator: "")
                guard let numMovie = readLine(), let num = Int(numMovie) else {
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
                guard let numMovie = readLine(), let num = Int(numMovie) else {
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
