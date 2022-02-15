//
//  AlamofireMovieServiceTests.swift
//  boilerPlateTests
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import XCTest
@testable import boilerPlate

class AlamofireMovieServiceTests: XCTestCase {
    
    var sut: MovieService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = AlamofireMovieService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_API_requestingTopMovies_isNotEmptyArray() {
        let topMoviesExpectation = expectation(description: "wait for alamofire service")
        var topMovies: [Movie] = []
        var error: Error?
        sut.topMovies { movies, responseError in
            topMovies = movies
            error = responseError
            topMoviesExpectation.fulfill()
        }
        wait(for: [topMoviesExpectation], timeout: 10)
        XCTAssertNil(error)
        XCTAssertFalse(topMovies.isEmpty)
    }

}
