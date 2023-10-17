//
//  DependencyDeclaration.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation
import NetworkLayer

private struct LocationsApiKey: InjectionKey {
    static var currentValue: LocationsApiType = LocationsApi()
}

private struct NetworkLayerKey: InjectionKey {
    static var currentValue: NetworkType = Network()
}

private struct URLRouterKey: InjectionKey {
    static var currentValue: URLRouterType = URLRouter()
}


extension InjectedValues {
    var locationsApi: LocationsApiType {
        get { Self[LocationsApiKey.self] }
        set { Self[LocationsApiKey.self] = newValue }
    }
    
    var networker: NetworkType {
        get { Self[NetworkLayerKey.self] }
        set { Self[NetworkLayerKey.self] = newValue }
    }
    
    var urlRouter: URLRouterType {
        get { Self[URLRouterKey.self] }
        set { Self[URLRouterKey.self] = newValue }
    }
}
