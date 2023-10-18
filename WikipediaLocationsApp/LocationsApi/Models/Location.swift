//
//  Locations.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation

struct Location: Decodable, Identifiable, Equatable {
    var name: String?
    var lattitude: Double
    var longiture: Double
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case name
        case lattitude = "lat"
        case longiture = "long"
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name && lhs.lattitude == rhs.lattitude && rhs.longiture == lhs.longiture
    }
}
 
extension Location {
    var latitudeDescription: String {
        "Latitude: \(lattitude)"
    }
    
    var longitudeDescription: String {
        "Longitude: \(longiture)"
    }
}
