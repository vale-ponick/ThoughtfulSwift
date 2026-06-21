//
//  movie.swift
//  ThoughtfulSwift
//
//  Created by Валерия Пономарева on 21.06.2026.
//

import Foundation

enum MovieFormat: String, Codable {
    case serial, featurefilm
}

enum MovieGenre: String, Codable {
    case drama, comedy, fantasy, horror, history, documental
}

struct Movie: Codable {
    let title: String
    let director: String
    let releaseYear: Int
    let runtime: Int
    let genre: [MovieGenre]
    var rating: Int
    var isWatched: Bool
}
