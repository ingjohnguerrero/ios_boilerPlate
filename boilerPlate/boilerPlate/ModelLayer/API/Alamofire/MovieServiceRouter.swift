//
//  MovieServiceRouter.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import Foundation

enum MovieServiceRouter: APIRoute {
    case topMovie
    
    var path: String {
        switch self {
        case .topMovie:
            return "movie/top_rated"
        }
    }
}
