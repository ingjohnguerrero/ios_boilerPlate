//
//  NonPersistentContext.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 14/02/22.
//

import Foundation

class NonPersistentContext: APIContext {
    var environment: APIEnvironment

    init(environment: APIEnvironment) {
        self.environment = environment
    }
}
