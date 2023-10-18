//
//  LocationsRepository.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation
import NetworkLayer
import SwiftUI

enum LocationsViewState: Equatable {
    case loading
    case error(String)
    case display
}

@MainActor class LocationsViewModel: ObservableObject {
    @Published var viewState: LocationsViewState = .loading
    @Published var locations: [Location] = []

    @Injected(\.locationsApi) var locationApi
    @Injected(\.urlRouter) var urlRouter
    func getLocations() {
        Task { [weak self] in
            guard let self = self else { return }
            let response = await self.locationApi.getLocations()
            switch response {
            case let .success(locations):
                self.locations = locations.locations
                self.viewState = .display
            case let .failure(error):
                self.viewState = .error(error.description)
            }
        }
    }
    
    func onLocationTapped(with location: Location) {
        urlRouter.openDestination(.wikipedia(location))
    }
}
