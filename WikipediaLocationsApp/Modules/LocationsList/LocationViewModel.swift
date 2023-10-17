//
//  LocationsRepository.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation
import NetworkLayer
import SwiftUI

enum LocationsViewState {
    case loading
    case error(String)
    case display
}

@MainActor class LocationsViewModel: ObservableObject {
    @Published var viewState: LocationsViewState = .loading
    @Published var locations: [Locations] = []

    @Injected(\.locationsApi) var locationApi
    func getLocations() {
        Task { 
            let response = await locationApi.getLocations()
            switch response {
            case let .success(locations):
                self.locations = locations.locations
                viewState = .display
            case let .failure(error):
                viewState = .error(error.description)
            }
        }
            
    }
}
