//
//  LocationsApi.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation
import NetworkLayer

protocol LocationsApiType {
    func getLocations() async -> Result<LocationsResponse, ApiError>
}

struct LocationsApi: LocationsApiType {
    @Injected(\.networker) var network: NetworkType
    func getLocations() async -> Result<LocationsResponse, ApiError> {
        let response = await network.request(with: LocationsEndpoint())
        return DataDecoder.decode(for: response)
    }
}
