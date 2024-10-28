//
//  MovieResponseEntity.swift
//  cinenest-uikit
//
//  Created by Arlid Henao Rueda on 29/09/24.
//

import Foundation

struct MovieResponseEntity: Decodable {
    let results: [MovieEntity]
}

struct MovieEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imageURL: URL?
    var votes: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case votes = "vote_count"
    }
}

