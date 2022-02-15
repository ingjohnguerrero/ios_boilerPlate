//
//  MockMovieService.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import Foundation

class MockMovieService: MovieService {
    
    var translator: MovieTranslator!
    
    init(translator: MovieTranslator = MovieDTOTranslator()) {
        self.translator = translator
    }
    
    func topMovies(completion: @escaping ([Movie], Error?) -> Void) {
        guard let jsonData = JsonHelper
                .data(from: .moviesResult) else { return completion([], MovieServiceError.unableToLoadMock) }
        do {
            let topMoviesDTO = try JSONDecoder().decode(TopMoviesDTO.self, from: jsonData)
            let movies = topMoviesDTO.results.map({ translator!.translate(from: $0) })
            completion(movies, nil)
        } catch {
            print(String(describing: error))
            completion([], error)
        }
    }
}
