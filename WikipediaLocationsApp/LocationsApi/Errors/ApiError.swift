//
//  ApiError.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation

enum ApiError: Error, CustomStringConvertible {
    case somethingWhenWrong
    case decodingError
    
    var description: String {
        switch self {
        case .somethingWhenWrong: "Something went wrong, please try again later."
        case .decodingError: "An error occur related to data"
        }
    }
}
