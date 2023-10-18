//
//  DestinationEndpointsTests.swift
//  WikipediaLocationsAppTests
//
//  Created by Igor Atamanciuc on 18/10/2023.
//

import XCTest
@testable import WikipediaLocationsApp

final class DestinationEndpointsTests: XCTestCase {
    func test_givenLocation_theExtractingURLFromEndpoint_shouldReturnCorrectURL() {
        // Arrange
        let destination = DestinationEndpoints.wikipedia(Location(lattitude: 111, longiture: 111))
        
        // Act
        let url = destination.url
        
        // Assert
        XCTAssertEqual(url, URL(string: "wikipedia://places?lat=111.0&lon=111.0"))
    }
}
