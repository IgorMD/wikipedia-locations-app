//
//  LocationsApiTests.swift
//  WikipediaLocationsAppTests
//
//  Created by Igor Atamanciuc on 18/10/2023.
//

import XCTest
@testable import WikipediaLocationsApp
import NetworkLayer

struct MockNetwork: NetworkType {
    var stubResult: Result<Data, NetworkLayer.NetworkError>
    func request(with endpoint: NetworkLayer.EndpointType) async -> Result<Data, NetworkLayer.NetworkError> {
        return stubResult
    }
}

var testData: Data = {
    """
    {
      "locations":
      [
        {
          "name": "Amsterdam",
          "lat": 52.3547498,
          "long": 4.8339215
        },
        {
          "name": "Mumbai",
          "lat": 19.0823998,
          "long": 72.8111468
        },
        {
          "name": "Copenhagen",
          "lat": 55.6713442,
          "long": 12.523785
        },
        {
          "lat": 40.4380638,
          "long": -3.7495758
        }
      ]
    }
    """
        .data(using: .utf8)!
}()

final class LocationsApiTests: XCTestCase {
    func test_givenDataIsValid_whenGettingLocations_thenLocationsResponseIsReturned() async {
        InjectedValues[\.networker] = MockNetwork(stubResult: .success(testData))
        
        let locationsApi = LocationsApi()
        let response = await locationsApi.getLocations()
        
        switch response {
        case let .success(locationResponse):
            XCTAssertEqual(locationResponse.locations.count, 4)
        default:
            XCTFail("Response result should .success")
            break
        }
    }
}
