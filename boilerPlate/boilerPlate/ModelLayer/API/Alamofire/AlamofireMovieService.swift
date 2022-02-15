//
//  AlamofireMovieService.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import Foundation

class AlamofireMovieService: AlamofireService {
    
    var translator: MovieTranslator
    var apiKey: String {
        return Bundle.main.infoDictionary?["api_key"] as? String ?? ""
    }
    
    init(translator: MovieTranslator) {
        self.translator = translator
        super.init(context: NonPersistentContext(environment: APIEnvironments.production))
    }
    
    convenience init() {
        self.init(translator: MovieDTOTranslator())
    }
    
}


extension AlamofireMovieService: MovieService {
    func topMovies(completion: @escaping ([Movie], Error?) -> Void) {
        let params: [String: Any] = [
            "api_key": apiKey,
            "language": "en-US",
            "region": "US",
            "page" : 1
        ]
        get(at: MovieServiceRouter.topMovie, params: params).responseDecodable(of: TopMoviesDTO.self) { [weak self] (response) in
            guard let self = self, let topMoviesDTO = response.value else {
                return completion([], response.error)
            }
            
            let translatedMovies = topMoviesDTO.results.map({ self.translator.translate(from: $0) })
            
            completion(translatedMovies, nil)
        }
    }
}
