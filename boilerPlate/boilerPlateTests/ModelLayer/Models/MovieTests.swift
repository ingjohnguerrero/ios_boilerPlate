//
//  MovieTestCase.swift
//  boilerPlateTests
//
//  Created by John Edwin Guerrero Ayala on 14/02/22.
//

import XCTest
@testable import boilerPlate

class MovieTests: XCTestCase {
    
    var sut: Movie!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Movie(id: 1234123, title: "John Doe", overview: "A handsome guy", popularity: 12345.6789, releaseDate: "1987-04-01")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_movie_withInitInformation_isNotNil() {
        XCTAssertNotNil(sut)
    }

}
