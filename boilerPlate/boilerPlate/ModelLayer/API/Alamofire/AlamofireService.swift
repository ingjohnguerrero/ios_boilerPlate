//
//  AlamofireService.swift
//  boilerPlate
//
//  Created by John Edwin Guerrero Ayala on 14/02/22.
//

import Foundation
import Alamofire

/// Alamofire Service implementation in order to encapsulate the most common networking classes
class AlamofireService {
    
    // MARK: - Public Properties -
    /// local context instance
    var context: APIContext
    
    // MARK: - Initializer -
    /// Class initializer
    /// - Parameter context: object containing evironment or domain for the service
    init(context: APIContext) {
        self.context = context
    }
    
    /// Class initializer with default context
    convenience init() {
        self.init(context: NonPersistentContext(environment: APIEnvironments.production))
    }
    
    /// Network request using GET method
    /// - Parameters:
    ///   - route: Route combining base url for domain and the path to the resource
    ///   - params: Request paremeters
    /// - Returns: Returns a DataRequest instance in order to handle the response
    /// in terms of json, Decodable, plain text, ...
    func get(at route: APIRoute, params: Parameters = [:]) -> DataRequest {
        return request(at: route, method: .get, params: params, encoding: URLEncoding.default)
    }
    
    /// Base network request in order to reuse this method depending of the call and type of call needed
    /// - Parameters:
    ///   - route: Route to the resouce combining the base url or domain and the path
    ///   - method: Request type method
    ///   - params: Parameters for the request
    ///   - encoding: Request parameters encoding
    /// - Returns:  Request instance in order to be handled by the called method
    func request(
        at route: APIRoute,
        method: HTTPMethod,
        params: Parameters = [:],
        encoding: ParameterEncoding
    ) -> DataRequest {
        let routeUrl = route.url(for: context.environment)
        return AF
            .request(routeUrl, method: method, parameters: params, encoding: encoding)
            .validate()
    }
    
    /// Cancel all the ongoing requests in the alamofire instance
    func cancelAllRequests() {
        Alamofire
            .Session
            .default
            .session
            .getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
                sessionDataTask.forEach { $0.cancel() }
                uploadData.forEach { $0.cancel() }
                downloadData.forEach { $0.cancel() }
            }
    }
}
