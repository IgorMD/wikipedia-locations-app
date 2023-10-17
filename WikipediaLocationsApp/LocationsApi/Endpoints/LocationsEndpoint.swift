//
//  LocationsEndpoint.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation
import NetworkLayer

struct LocationsEndpoint: EndpointType {
    var host: String = "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
    var pathComponents: [String] = []
    var httpMethod = HTTPMethod .get
    var queries: [String : String] = [:]
}
