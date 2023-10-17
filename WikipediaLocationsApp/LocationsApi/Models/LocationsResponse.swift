//
//  LocationsResponse.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation


struct LocationsResponse: Decodable {
    var locations: [Locations]
}
