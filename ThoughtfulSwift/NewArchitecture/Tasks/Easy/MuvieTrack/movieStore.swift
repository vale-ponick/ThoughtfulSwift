//
//  movieStore.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 21.06.2026.
//

import Foundation

class MovieStore {
    private(set) var movies: [Movie] = []
    
    private var fileURL: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("movie.json")
    }
    
    func add(movie: Movie) {
        movies.append(movie)
        print("Added \(movie.title)")
    }
    
    func delete(at index: Int) {
        guard movies.indices.contains(index) else {
            
            print("Invalid index")
            return
        }
        let removedMovie = movies.remove(at: index)
        print("Deleted: \(removedMovie) title")
    }
    
    func view(at index: Int) {
        guard movies.indices.contains(index) else {
            print("Book not found")
            return
        }
        let movie = movies[index]
        print(movie.title)
        print("Director: \(movie.director)")
        print("Release year: \(movie.releaseYear)")
        print("Genre: \(movie.genre)")
        print("Runtime: \(movie.runtime)")
        print("Rating: \(movie.rating)")
        print("Watched: \(movie.isWatched ? "✅" : "❌")")
    }
    
    func list() {
        guard !movies.isEmpty else {
            print("No movies")
            return
        }
        for (index, movie) in movies.enumerated() {
            print("\(index + 1). \(movie.title) - \(movie.director) (\(movie.releaseYear))")
        }
    }
    func save() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(movies) else {
            print("Failed to encode movies")
            return
        }
        try? data.write(to: fileURL)
        print("Saved \(movies.count) movies")
    }
    
    func load() {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
        guard let data = try? Data(contentsOf: fileURL) else {
            print("Failed to read data")
            return
        }
        let decoder = JSONDecoder()
        guard let loadedMovie = try? decoder.decode([Movie].self, from: data) else {
            print("Failed to decode movies")
            return
        }
        movies = loadedMovie
        print("loaded \(movies.count) movies")
    }
    
    func export() {
        var result = ""
        for (index, movie) in movies.enumerated() {
            result += "\(index + 1). \(movie.title) - \(movie.director) (\(movie.releaseYear))\n"
        }
        let textURL = fileURL.deletingLastPathComponent().appending(path: "movies.txt", directoryHint: .notDirectory)
        guard let data = result.data(using: .utf8) else {
            print("Failed to convert text")
            return
        }
        do {
            try data.write(to: textURL)
            print("Exported \(movies.count) movies to movies.txt")
        } catch {
            print("Failed to export: \(error)")
        }
    }
}


