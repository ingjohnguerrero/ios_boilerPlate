//
//  MovieDTO.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import Foundation

/// API top movies result mapping object
struct MovieDTO {
    
    var id: Int
    var title: String
    var overview: String
    var popularity: Float
    var releaseDate: String
    
}

extension MovieDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case popularity = "popularity"
        case releaseDate = "release_date"
    }
}
