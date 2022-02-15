//
//  MovieServiceTests.swift
//  boilerPlateTests
//
//  Created by John Edwin Guerrero Ayala on 15/02/22.
//

import XCTest
@testable import boilerPlate

class MovieServiceTests: XCTestCase {
    
    var sut: MovieService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockMovieService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_movieService_gettingTopMovies_isNotEmptyArray() {
        let topMoviesExpectation = expectation(description: "Wait for top movies response")
        var topMovies: [Movie] = []
        var error: Error?
        sut.topMovies { movies, responseError in
            topMovies = movies
            error = responseError
            topMoviesExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (expectationError) in
            XCTAssertFalse(topMovies.isEmpty)
            XCTAssertNil(error)
        }
    }

}
