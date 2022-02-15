//
//  APIEnvironments.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 14/02/22.
//

import Foundation

enum APIEnvironments: String, APIEnvironment {

    case production = "API_BASE_URL"

    var baseUrl: String {
        return (Bundle.main.infoDictionary?[self.rawValue] as? String)?
            .replacingOccurrences(of: "\\", with: "") ?? ""
    }

}
