//
//  DestinationRouter.swift
//  WikipediaLocationsApp
//
//  Created by Igor Atamanciuc on 17/10/2023.
//

import Foundation
import UIKit

enum DestinationEndpoints {
    case wikipedia(Location)
    
    var url: URL? {
        switch self {
        case let .wikipedia(location):
            return URL(string: "wikipedia://places?lat=\(location.lattitude)&lon=\(location.longiture)")
        }
    }
}

protocol URLRouterType {
    func openDestination(_ destination: DestinationEndpoints)
}

struct URLRouter: URLRouterType {
    let application: UIApplication
    
    init(application: UIApplication = .shared) {
        self.application = application
    }
    
    func openDestination(_ destination: DestinationEndpoints) {
        guard let url = destination.url, application.canOpenURL(url) else {
            return
        }
        application.open(url)
    }
}
