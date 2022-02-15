//
//  TopMoviesDTO.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import Foundation

/// API top movies result mapping object
struct TopMoviesDTO {

    /// Current page
    var page: Int

    /// Total pages in result
    var totalPages: Int
    
    /// Total results
    var totalResults: Int

    /// Result movies
    var results: [MovieDTO]
}

extension TopMoviesDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results = "results"
    }
}
