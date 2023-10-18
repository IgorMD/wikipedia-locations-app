//
//  LocationsTests.swift
//  WikipediaLocationsAppTests
//
//  Created by Igor Atamanciuc on 18/10/2023.
//

import XCTest
@testable import WikipediaLocationsApp

final class LocationsTests: XCTestCase {
    
    func test_LatitudeAndLongitudeDescritpion() {
        // Arrange
        let testValue: Double = 11111
        let location = Location(lattitude: testValue, longiture: testValue)
        
        // Act
        
        // Assert
        XCTAssertEqual(location.latitudeDescription, "Latitude: \(testValue)")
        XCTAssertEqual(location.longitudeDescription, "Longitude: \(testValue)")
    }
}
