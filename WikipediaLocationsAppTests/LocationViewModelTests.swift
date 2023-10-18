//
//  LocationViewModelTests.swift
//  WikipediaLocationsAppTests
//
//  Created by Igor Atamanciuc on 18/10/2023.
//

import XCTest
@testable import WikipediaLocationsApp
import Combine

struct MockLocationsApi: LocationsApiType {
    var responseStub: Result<LocationsResponse, ApiError>
    func getLocations() async -> Result<LocationsResponse, ApiError> {
        return responseStub
    }
}

extension LocationsResponse {
    static var mock: Self {
        .init(locations: [.mock])
    }
}

extension Location {
    static var mock: Self {
        .init(name: "Amsterdam",lattitude: 0000, longiture: 1111)
    }
}

class MockURLRouter: URLRouterType {
    var didCallOpenDestionation = false
    func openDestination(_ destination: DestinationEndpoints) {
        didCallOpenDestionation = true
    }
}

@MainActor
final class LocationViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func test_givenViewModelIsInitialised_viewStateShouldBeLoading() async {
        // Arrange
        let viewModel = LocationsViewModel()
        
        // Assert
        XCTAssertEqual(viewModel.viewState, .loading)
    }
    
    
    
    func test_givenSuccessResult_whenGetLocationsIsCalled_thenLocationsArePopulated() async {
        // Arrange
        InjectedValues[\.locationsApi] = MockLocationsApi(responseStub: .success(.mock))
        let viewModel = LocationsViewModel()
        
        viewModel.$locations
            .dropFirst()
            .sink(receiveValue: {
                // Assert
                XCTAssertEqual($0, [Location.mock])
            })
            .store(in: &cancellables)
        
        viewModel.$viewState
            .dropFirst()
            .sink(receiveValue: {
                // Assert
                XCTAssertEqual($0, .display)
            })
            .store(in: &cancellables)
        // Act
        viewModel.getLocations()
    }
    
    func test_givenFailureResult_whenGetLocationsIsCalled_thenViewStateIsChangedToFailed() async {
        // Arrange
        InjectedValues[\.locationsApi] = MockLocationsApi(responseStub: .failure(.decodingError))
        let viewModel = LocationsViewModel()
        
        viewModel.$viewState
          .dropFirst()
          .sink(receiveValue: {
              // Assert
              XCTAssertEqual($0, .error(ApiError.decodingError.description))
              XCTAssertTrue(viewModel.locations.isEmpty)
          })
          .store(in: &cancellables)
        // Act
        viewModel.getLocations()
    }
    
    func test_givenLocationsAreAvailable_whenCallingDidTapped_thenRouterHandlesTheChange() {
        // Arrange
        var urlRouter = MockURLRouter()
        InjectedValues[\.urlRouter] = urlRouter
        let viewModel = LocationsViewModel()
        
        // Act
        viewModel.onLocationTapped(with: .mock)
        
        // Assert
        XCTAssertTrue(urlRouter.didCallOpenDestionation)
    }
}
