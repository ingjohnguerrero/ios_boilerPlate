//
//  MovieDTOTranslator.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import Foundation

protocol MovieTranslator {
    func translate(from movieDTO: MovieDTO) -> Movie
}

class MovieDTOTranslator: MovieTranslator {
    func translate(from movieDTO: MovieDTO) -> Movie {
        return Movie(
            id: movieDTO.id,
            title: movieDTO.title,
            overview: movieDTO.overview,
            popularity: movieDTO.popularity,
            releaseDate: movieDTO.releaseDate
        )
    }
}
