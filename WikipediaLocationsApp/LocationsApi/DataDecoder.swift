//
//  DataDecoder.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation
import NetworkLayer

struct DataDecoder {
    static func decode<T: Decodable>(for result: Result<Data, NetworkError>) -> Result<T, ApiError> {
        switch result {
        case .success(let data):
            do {
                let decodedModel = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedModel)
            } catch {
                return .failure(.decodingError)
            }
        case .failure(_):
            return .failure(.somethingWhenWrong)
        }
    }
}
