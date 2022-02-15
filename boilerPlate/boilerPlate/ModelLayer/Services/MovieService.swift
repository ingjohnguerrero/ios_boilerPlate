//
//  MovieService.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import Foundation

/// Service in charge of prividing Movie data
protocol MovieService {
    typealias MoviesResponse = (_ movies: [Movie], _ error: Error?) -> Void
    
    /// ItemDTO to product translator
//    var translator: MovieDTOTranslator? { get set }

    /// Request top movies
    /// - Parameters:
    ///   - completion: How to handle the information upon response from server
    func topMovies(completion: @escaping MovieService.MoviesResponse)
}
