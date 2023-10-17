//
//  Locations.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation

struct Location: Decodable, Identifiable {
    var name: String?
    var lattitude: Double
    var longiture: Double
    var id = UUID()
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case lattitude = "lat"
        case longiture = "long"
    }
    
}
